class AclDao
  attr_accessor :access_token, :client_id, :base_url

  def initialize(token, client_id, base_url)
    @access_token = token
    @client_id = client_id
    @base_url = base_url
  end

  # returns [role, daac_name]
  def get_role_and_daac(user_id)

    # Sets whether the user is a specific role type
    # Note: user could be all three.

    results = search_acls_by_user(user_id, 1)
    if results['errors']
      message = %Q({"error":"#{results['errors']}", "uid":"#{user_id}", "description":"Error retrieving ACLs from CMR for #{user_id}"})
      Rails.logger.error(Cmr::truncate_cmr_tokens(message))
      raise Cmr::CmrError.new("Error retrieving ACLs from CMR for #{user_id}")
    end
    unless results['hits']
      message = %Q("error":"Error retrieving ACLs from CMR for #{user_id}", "uid":"#{user_id}"})
      Rails.logger.error(Cmr::truncate_cmr_tokens(message))
      raise Cmr::CmrError.new("Error retrieving ACLs from CMR for #{user_id}")
    end
    noPages = (results['hits']/2000).ceil
    items = Array.wrap(results['items'])

    (2..noPages+1).each do |i|
      results = search_acls_by_user(user_id, i)
      items += Array.wrap(results['items'])
    end

    roles = Set.new

    # this logic assumes that a user can only belong to 1 daac, which is the case with dashboard.
    daac = nil
    items.each do |item|
      if item['name'].end_with?"DASHBOARD_DAAC_CURATOR"

        if daac
          # there is already daac assigned, this means CMR OPS team has provisioned a user with more than 1 DAAC
          # so we should mentioned something in the logs.
          Rails.logger.error("Error: User #{user_id} is already provisioned with a DAAC (#{daac})")
        end

        location = item['location']
        acl = send_request_to_cmr :GET, location, nil
        daac = acl['provider_identity']['provider_id']
        roles << "daac_curator"

      end
      roles << "arc_curator" if item['name'].end_with?"DASHBOARD_ARC_CURATOR"
      roles << "admin" if item['name'].end_with?"DASHBOARD_ADMIN"
    end

    #
    # returns the highest level role
    #
    return ["admin", nil] if roles.include? "admin"
    return ["daac_curator",daac] if roles.include? "daac_curator"
    return ["arc_curator", nil] if roles.include? "arc_curator"

    nil
  end


  private
    def search_acls_by_user(user_id, page_no)
      json = send_request_to_cmr(:GET , "/access-control/acls?permitted_user=#{user_id}&page_size=2000&page_num=#{page_no}")
      json
    end

    def send_request_to_cmr(action, endpoint, data = nil)
      conn = Faraday.new(:url => @base_url) do |faraday|
        faraday.headers['Echo-Token'] = "#{@access_token}:#{ENV['urs_client_id']}"
        faraday.request :json
        faraday.response :logger # log requests to $stdout
        faraday.adapter Faraday.default_adapter # make requests with Net::HTTP
      end
      case action
        when :DELETE
          response = conn.delete endpoint, data
        when :PUT
          response = conn.put endpoint, data
        when :POST
          response = conn.post endpoint, data
        when :GET
          response = conn.get endpoint, data
      end
      message = %Q({"action":"call_external_resource", "method":"send_request_to_cmr",
          "url":"#{@base_url}/#{endpoint}", "response_code":#{response.status},
          "response": "#{response.body}"});
      Rails.logger.info(Cmr::truncate_cmr_tokens(message))

      json = JSON.parse(response.body)
      json
    end
end



