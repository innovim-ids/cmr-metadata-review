require 'test_helper'
Dir[Rails.root.join("test/**/*.rb")].each {|f| require f}

class CollectionsControllerTest < ActionController::TestCase
  include OmniauthMacros

  let(:user) { User.find_by_email("abaker@element84.com") }

  setup do
    @cmr_base_url = Cmr.get_cmr_base_url
  end

  describe "GET #show" do
    it "loads the correct collection on show" do
      sign_in(user)
      stub_urs_access(user.uid, user.access_token, user.refresh_token)

      #stubbing all requests for raw_data
      stub_request(:get, "#{@cmr_base_url}/search/collections.echo10?concept_id=C1000000020-LANCEAMSR2").with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).to_return(:status => 200, :body => "<?xml version=\"1.0\" encoding=\"UTF-8\"?><results><hits>1</hits><took>14</took><result concept-id=\"C1000000020-LANCEAMSR2\" revision-id=\"8\" format=\"application/echo10+xml\">\n<Collection>\n<ShortName>A2_DySno_NRT</ShortName>\n<VersionId>0</VersionId>\n<InsertTime>2015-05-01T13:26:43Z</InsertTime>\n<LastUpdate>2015-09-14T13:26:43Z</LastUpdate>\n<LongName>NRT AMSR2 DAILY L3 GLOBAL SNOW WATER EQUIVALENT EASE-GRIDS</LongName>\n<DataSetId>NRT AMSR2 DAILY L3 GLOBAL SNOW WATER EQUIVALENT EASE-GRIDS V0</DataSetId>\n<Description>The Advanced Microwave Scanning Radiometer 2 (AMSR2) instrument on the Global Change Observation Mission - Water 1 (GCOM-W1) provides global passive microwave measurements of terrestrial, oceanic, and atmospheric parameters for the investigation of global water and energy cycles.  Near real-time (NRT) products are generated within 3 hours of the last observations in the file, by the Land Atmosphere Near real-time Capability for EOS (LANCE) at the AMSR Science Investigator-led Processing System (AMSR SIPS), which is collocated with the Global Hydrology Resource Center (GHRC) DAAC.  The GCOM-W1 AMSR2 Level-3 Snow Water Equivalent (SWE) data set contains snow water equivalent (SWE) data and quality assurance flags mapped to Northern and Southern Hemisphere 25 km Equal-Area Scalable Earth Grids (EASE-Grids).  Data are stored in HDF-EOS5 format and are available via HTTP from the EOSDIS LANCE system at https://lance.nsstc.nasa.gov/amsr2-science/data/level3/daysnow/R00/hdfeos5/.  If data latency is not a primary concern, please consider using science quality products.  Science products are created using the best available ancillary, calibration and ephemeris information.  Science quality products are an internally consistent, well-calibrated record of the Earth's geophysical properties to support science.  The AMSR SIPS plans to start producing initial AMSR2 standard science quality data products in late 2015 and they will be available from the NSIDC DAAC.  Notice: All LANCE AMSR2 data should be used with the understanding that these are preliminary products.  Cross calibration with AMSR-E products has not been performed.  As updates are made to the L1R data set, those changes will be reflected in this higher level product.</Description>\n<CollectionDataType>NEAR_REAL_TIME</CollectionDataType>\n<Orderable>false</Orderable>\n<Visible>true</Visible>\n<ProcessingLevelId>3</ProcessingLevelId>\n<ArchiveCenter>GHRC</ArchiveCenter>\n<CitationForExternalPublication>Tedesco, M., J. Jeyaratnam, and R. Kelly. 2015. NRT AMSR2 Daily L3 Global Snow Water Equivalent EASE-Grids [indicate subset used]. Dataset available online, [https://lance.nsstc.nasa.gov/amsr2-science/data/level3/daysnow/R00/hdfeos5/] from NASA LANCE AMSR2 at the GHRC DAAC Huntsville, Alabama, U.S.A. doi: http://dx.doi.org/10.5067/AMSR2/A2_DySno_NRT</CitationForExternalPublication><Price>0.0</Price><SpatialKeywords>\n<Keyword>GLOBAL</Keyword></SpatialKeywords><TemporalKeywords>\n<Keyword>DAILY</Keyword></TemporalKeywords><Temporal><RangeDateTime>\n<BeginningDateTime>2015-05-01T00:00:00Z</BeginningDateTime></RangeDateTime></Temporal><Contacts><Contact>\n<Role>GHRC USER SERVICES</Role><OrganizationEmails>\n<Email>ghrc-dmg@itsc.uah.edu</Email></OrganizationEmails></Contact></Contacts><ScienceKeywords><ScienceKeyword>\n<CategoryKeyword>EARTH SCIENCE</CategoryKeyword>\n<TopicKeyword>CRYOSPHERE</TopicKeyword>\n<TermKeyword>SNOW/ICE</TermKeyword><VariableLevel1Keyword>\n<Value>SNOW WATER EQUIVALENT</Value></VariableLevel1Keyword></ScienceKeyword><ScienceKeyword>\n<CategoryKeyword>EARTH SCIENCE</CategoryKeyword>\n<TopicKeyword>TERRESTRIAL HYDROSPHERE</TopicKeyword>\n<TermKeyword>SNOW/ICE</TermKeyword><VariableLevel1Keyword>\n<Value>SNOW WATER EQUIVALENT</Value></VariableLevel1Keyword></ScienceKeyword></ScienceKeywords><Platforms><Platform>\n<ShortName>GCOM-W1</ShortName>\n<LongName>GCOM-W1</LongName>\n<Type>SATELLITE</Type><Instruments><Instrument>\n<ShortName>AMSR2</ShortName><Sensors><Sensor>\n<ShortName>AMSR2</ShortName></Sensor></Sensors></Instrument></Instruments></Platform></Platforms>\n<AdditionalAttributes>\n<AdditionalAttribute>\n<Name>identifier_product_doi</Name>\n<DataType>STRING</DataType>\n<Description>product DOI</Description>\n<Value>10.5067/AMSR2/A2_DySno_NRT</Value>\n</AdditionalAttribute>\n<AdditionalAttribute>\n<Name>identifier_product_doi_authority</Name>\n<DataType>STRING</DataType>\n<Description>DOI authority</Description>\n<Value>http://dx.doi.org</Value>\n</AdditionalAttribute>\n</AdditionalAttributes>\n<Campaigns><Campaign>\n<ShortName>LANCE</ShortName></Campaign></Campaigns><OnlineAccessURLs><OnlineAccessURL>\n<URL>https://lance.nsstc.nasa.gov/amsr2-science/data/level3/daysnow/R00/hdfeos5/</URL><URLDescription></URLDescription><MimeType></MimeType></OnlineAccessURL></OnlineAccessURLs><OnlineResources><OnlineResource>\n<URL>https://lance.itsc.uah.edu/amsr2-science/data/level3/daysnow/R00/hdfeos5/</URL><Description></Description>\n<Type>Alternate Data Access</Type></OnlineResource><OnlineResource>\n<URL>https://lance.nsstc.nasa.gov/amsr2-science/browse_png/level3/daysnow/R00/</URL><Description></Description>\n<Type>Browse</Type></OnlineResource><OnlineResource>\n<URL>https://worldview.earthdata.nasa.gov/</URL><Description></Description>\n<Type>Worldview Imagery</Type></OnlineResource><OnlineResource>\n<URL>http://lance.nsstc.nasa.gov/</URL><Description></Description>\n<Type>Homepage</Type></OnlineResource><OnlineResource>\n<URL>http://lance.nsstc.nasa.gov/amsr2-science/doc/LANCE_A2_DySno_NRT_dataset.pdf</URL><Description></Description>\n<Type>Guide</Type></OnlineResource><OnlineResource>\n<URL>http://dx.doi.org/10.5067/AMSR2/A2_DySno_NRT</URL><Description></Description>\n<Type>DOI</Type></OnlineResource><OnlineResource>\n<URL>http://ghrc.nsstc.nasa.gov/uso/citation.html</URL><Description></Description>\n<Type>Citing GHRC Data</Type></OnlineResource></OnlineResources><AssociatedDIFs><DIF>\n<EntryId>A2_DySno_NRT</EntryId></DIF></AssociatedDIFs><Spatial><SpatialCoverageType>Horizontal</SpatialCoverageType><HorizontalSpatialDomain><Geometry>\n<CoordinateSystem>CARTESIAN</CoordinateSystem><BoundingRectangle>\n<WestBoundingCoordinate>-180</WestBoundingCoordinate>\n<NorthBoundingCoordinate>90</NorthBoundingCoordinate>\n<EastBoundingCoordinate>180</EastBoundingCoordinate>\n<SouthBoundingCoordinate>-90</SouthBoundingCoordinate></BoundingRectangle></Geometry></HorizontalSpatialDomain>\n<GranuleSpatialRepresentation>CARTESIAN</GranuleSpatialRepresentation></Spatial>\n<MetadataStandardName>ECHO</MetadataStandardName>\n<MetadataStandardVersion>10</MetadataStandardVersion>\n</Collection></result></results>", :headers => {"date"=>["Tue, 21 Feb 2017 16:02:46 GMT"], "content-type"=>["application/echo10+xml; charset=utf-8"], "access-control-expose-headers"=>["CMR-Hits, CMR-Request-Id"], "access-control-allow-origin"=>["*"], "cmr-hits"=>["10554"], "cmr-took"=>["40"], "cmr-request-id"=>["5b0c8426-3a23-4025-a4d3-6d1c9024153a"], "vary"=>["Accept-Encoding, User-Agent"], "connection"=>["close"], "server"=>["Jetty(9.2.z-SNAPSHOT)"]})

      stub_request(:get, "https://cmr.sit.earthdata.nasa.gov/search/granules.echo10?concept_id=G309210-GHRC").
        with(
          headers: {
            'Accept'=>'*/*',
            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'User-Agent'=>'Ruby'
          }).
        to_return(status: 200, body: '<?xml version="1.0" encoding="UTF-8"?><results><hits>1</hits><took>29</took><result concept-id="G1581545525-LANCEAMSR2" collection-concept-id="C1000000020-LANCEAMSR2" revision-id="15" format="application/echo10+xml">
    <Granule>
      <GranuleUR>AMSR_2_L3_DailySnow_P00_20190102.he5</GranuleUR>
      <InsertTime>2019-01-03T02:14:37Z</InsertTime>
      <LastUpdate>2019-01-03T02:14:37Z</LastUpdate>
      <DeleteTime>2019-01-16T23:59:59.999Z</DeleteTime>
      <Collection>
        <ShortName>A2_DySno_NRT</ShortName>
        <VersionId>0</VersionId>
      </Collection>
      <DataGranule>
        <DayNightFlag>BOTH</DayNightFlag>
        <ProductionDateTime>2019-01-03T02:14:37Z</ProductionDateTime>
        <LocalVersionId>P00</LocalVersionId>
      </DataGranule>
      <PGEVersionClass>
        <PGEName>DailySnow</PGEName>
        <PGEVersion>00</PGEVersion>
      </PGEVersionClass>
      <Temporal>
        <RangeDateTime>
          <BeginningDateTime>2019-01-02T00:26:32Z</BeginningDateTime>
          <EndingDateTime>2019-01-03T00:14:57Z</EndingDateTime>
        </RangeDateTime>
      </Temporal>
        <Spatial>
          <HorizontalSpatialDomain>
            <Geometry>
              <BoundingRectangle>
                <WestBoundingCoordinate>-180.0</WestBoundingCoordinate>
                <NorthBoundingCoordinate>90.0</NorthBoundingCoordinate>
                <EastBoundingCoordinate>180.0</EastBoundingCoordinate>
                <SouthBoundingCoordinate>-90.0</SouthBoundingCoordinate>
              </BoundingRectangle>
            </Geometry>
          </HorizontalSpatialDomain>
        </Spatial>
      <MeasuredParameters>
        <MeasuredParameter>
          <ParameterName>Snow Water Equivalent</ParameterName>
        </MeasuredParameter>
      </MeasuredParameters>
      <AdditionalAttributes>
        <AdditionalAttribute>
          <Name>identifier_product_doi</Name>
          <Values>
            <Value>10.5067/AMSR2/A2_DySno_NRT</Value>
          </Values>
        </AdditionalAttribute>
        <AdditionalAttribute>
          <Name>identifier_product_doi_authority</Name>
          <Values>
            <Value>http://dx.doi.org</Value>
          </Values>
        </AdditionalAttribute>
      </AdditionalAttributes>
      <InputGranules>
        <InputGranule>(GW1AM2_201901020026_185D_L1SNRTBR_2220220.h5</InputGranule>
      </InputGranules>
      <OnlineAccessURLs>
        <OnlineAccessURL>
          <URL>https://lance.nsstc.nasa.gov/amsr2-science/data/level3/daysnow/R00/hdfeos5/AMSR_2_L3_DailySnow_P00_20190102.he5</URL>
          <URLDescription>Online access to AMSR-2 Near-Real-Time LANCE Products (primary)</URLDescription>
        </OnlineAccessURL>
        <OnlineAccessURL>
          <URL>https://lance.itsc.uah.edu/amsr2-science/data/level3/daysnow/R00/hdfeos5/AMSR_2_L3_DailySnow_P00_20190102.he5</URL>
          <URLDescription>Online access to AMSR-2 Near-Real-Time LANCE Products (backup)</URLDescription>
        </OnlineAccessURL>
      </OnlineAccessURLs>
      <OnlineResources>
        <OnlineResource>
          <URL>http://dx.doi.org/10.5067/AMSR2/A2_DySno_NRT</URL>
          <Type>Data Object Identifier</Type>
        </OnlineResource>
      </OnlineResources>
      <Orderable>true</Orderable>
      <DataFormat>HDF-EOS 5</DataFormat>
    </Granule></result></results>', headers: {})


      get :show, id: 1, record_id: 1
      collection_records = assigns(:collection_records)
      assert_equal(3, collection_records.length)
    end

    it "redirects when no concept id is provided" do
      #redirects no record_id
      get :show, id: 1
      assert_equal(response.code, "302")
    end

    it "redirects when no collection is found" do
      #redirects no collection found
      get :show, id: 1, record_id: "xyz"
      assert_equal(response.code, "302")
    end

  it "detects if a granule is no longer in cmr" do
    sign_in(user)
    stub_urs_access(user.uid, user.access_token, user.refresh_token)

    #stubbing all requests for raw_data
    stub_request(:get, "#{@cmr_base_url}/search/collections.echo10?concept_id=C1000000020-LANCEAMSR2").with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).to_return(:status => 200, :body => "<?xml version=\"1.0\" encoding=\"UTF-8\"?><results><hits>1</hits><took>14</took><result concept-id=\"C1000000020-LANCEAMSR2\" revision-id=\"8\" format=\"application/echo10+xml\">\n<Collection>\n<ShortName>A2_DySno_NRT</ShortName>\n<VersionId>0</VersionId>\n<InsertTime>2015-05-01T13:26:43Z</InsertTime>\n<LastUpdate>2015-09-14T13:26:43Z</LastUpdate>\n<LongName>NRT AMSR2 DAILY L3 GLOBAL SNOW WATER EQUIVALENT EASE-GRIDS</LongName>\n<DataSetId>NRT AMSR2 DAILY L3 GLOBAL SNOW WATER EQUIVALENT EASE-GRIDS V0</DataSetId>\n<Description>The Advanced Microwave Scanning Radiometer 2 (AMSR2) instrument on the Global Change Observation Mission - Water 1 (GCOM-W1) provides global passive microwave measurements of terrestrial, oceanic, and atmospheric parameters for the investigation of global water and energy cycles.  Near real-time (NRT) products are generated within 3 hours of the last observations in the file, by the Land Atmosphere Near real-time Capability for EOS (LANCE) at the AMSR Science Investigator-led Processing System (AMSR SIPS), which is collocated with the Global Hydrology Resource Center (GHRC) DAAC.  The GCOM-W1 AMSR2 Level-3 Snow Water Equivalent (SWE) data set contains snow water equivalent (SWE) data and quality assurance flags mapped to Northern and Southern Hemisphere 25 km Equal-Area Scalable Earth Grids (EASE-Grids).  Data are stored in HDF-EOS5 format and are available via HTTP from the EOSDIS LANCE system at https://lance.nsstc.nasa.gov/amsr2-science/data/level3/daysnow/R00/hdfeos5/.  If data latency is not a primary concern, please consider using science quality products.  Science products are created using the best available ancillary, calibration and ephemeris information.  Science quality products are an internally consistent, well-calibrated record of the Earth's geophysical properties to support science.  The AMSR SIPS plans to start producing initial AMSR2 standard science quality data products in late 2015 and they will be available from the NSIDC DAAC.  Notice: All LANCE AMSR2 data should be used with the understanding that these are preliminary products.  Cross calibration with AMSR-E products has not been performed.  As updates are made to the L1R data set, those changes will be reflected in this higher level product.</Description>\n<CollectionDataType>NEAR_REAL_TIME</CollectionDataType>\n<Orderable>false</Orderable>\n<Visible>true</Visible>\n<ProcessingLevelId>3</ProcessingLevelId>\n<ArchiveCenter>GHRC</ArchiveCenter>\n<CitationForExternalPublication>Tedesco, M., J. Jeyaratnam, and R. Kelly. 2015. NRT AMSR2 Daily L3 Global Snow Water Equivalent EASE-Grids [indicate subset used]. Dataset available online, [https://lance.nsstc.nasa.gov/amsr2-science/data/level3/daysnow/R00/hdfeos5/] from NASA LANCE AMSR2 at the GHRC DAAC Huntsville, Alabama, U.S.A. doi: http://dx.doi.org/10.5067/AMSR2/A2_DySno_NRT</CitationForExternalPublication><Price>0.0</Price><SpatialKeywords>\n<Keyword>GLOBAL</Keyword></SpatialKeywords><TemporalKeywords>\n<Keyword>DAILY</Keyword></TemporalKeywords><Temporal><RangeDateTime>\n<BeginningDateTime>2015-05-01T00:00:00Z</BeginningDateTime></RangeDateTime></Temporal><Contacts><Contact>\n<Role>GHRC USER SERVICES</Role><OrganizationEmails>\n<Email>ghrc-dmg@itsc.uah.edu</Email></OrganizationEmails></Contact></Contacts><ScienceKeywords><ScienceKeyword>\n<CategoryKeyword>EARTH SCIENCE</CategoryKeyword>\n<TopicKeyword>CRYOSPHERE</TopicKeyword>\n<TermKeyword>SNOW/ICE</TermKeyword><VariableLevel1Keyword>\n<Value>SNOW WATER EQUIVALENT</Value></VariableLevel1Keyword></ScienceKeyword><ScienceKeyword>\n<CategoryKeyword>EARTH SCIENCE</CategoryKeyword>\n<TopicKeyword>TERRESTRIAL HYDROSPHERE</TopicKeyword>\n<TermKeyword>SNOW/ICE</TermKeyword><VariableLevel1Keyword>\n<Value>SNOW WATER EQUIVALENT</Value></VariableLevel1Keyword></ScienceKeyword></ScienceKeywords><Platforms><Platform>\n<ShortName>GCOM-W1</ShortName>\n<LongName>GCOM-W1</LongName>\n<Type>SATELLITE</Type><Instruments><Instrument>\n<ShortName>AMSR2</ShortName><Sensors><Sensor>\n<ShortName>AMSR2</ShortName></Sensor></Sensors></Instrument></Instruments></Platform></Platforms>\n<AdditionalAttributes>\n<AdditionalAttribute>\n<Name>identifier_product_doi</Name>\n<DataType>STRING</DataType>\n<Description>product DOI</Description>\n<Value>10.5067/AMSR2/A2_DySno_NRT</Value>\n</AdditionalAttribute>\n<AdditionalAttribute>\n<Name>identifier_product_doi_authority</Name>\n<DataType>STRING</DataType>\n<Description>DOI authority</Description>\n<Value>http://dx.doi.org</Value>\n</AdditionalAttribute>\n</AdditionalAttributes>\n<Campaigns><Campaign>\n<ShortName>LANCE</ShortName></Campaign></Campaigns><OnlineAccessURLs><OnlineAccessURL>\n<URL>https://lance.nsstc.nasa.gov/amsr2-science/data/level3/daysnow/R00/hdfeos5/</URL><URLDescription></URLDescription><MimeType></MimeType></OnlineAccessURL></OnlineAccessURLs><OnlineResources><OnlineResource>\n<URL>https://lance.itsc.uah.edu/amsr2-science/data/level3/daysnow/R00/hdfeos5/</URL><Description></Description>\n<Type>Alternate Data Access</Type></OnlineResource><OnlineResource>\n<URL>https://lance.nsstc.nasa.gov/amsr2-science/browse_png/level3/daysnow/R00/</URL><Description></Description>\n<Type>Browse</Type></OnlineResource><OnlineResource>\n<URL>https://worldview.earthdata.nasa.gov/</URL><Description></Description>\n<Type>Worldview Imagery</Type></OnlineResource><OnlineResource>\n<URL>http://lance.nsstc.nasa.gov/</URL><Description></Description>\n<Type>Homepage</Type></OnlineResource><OnlineResource>\n<URL>http://lance.nsstc.nasa.gov/amsr2-science/doc/LANCE_A2_DySno_NRT_dataset.pdf</URL><Description></Description>\n<Type>Guide</Type></OnlineResource><OnlineResource>\n<URL>http://dx.doi.org/10.5067/AMSR2/A2_DySno_NRT</URL><Description></Description>\n<Type>DOI</Type></OnlineResource><OnlineResource>\n<URL>http://ghrc.nsstc.nasa.gov/uso/citation.html</URL><Description></Description>\n<Type>Citing GHRC Data</Type></OnlineResource></OnlineResources><AssociatedDIFs><DIF>\n<EntryId>A2_DySno_NRT</EntryId></DIF></AssociatedDIFs><Spatial><SpatialCoverageType>Horizontal</SpatialCoverageType><HorizontalSpatialDomain><Geometry>\n<CoordinateSystem>CARTESIAN</CoordinateSystem><BoundingRectangle>\n<WestBoundingCoordinate>-180</WestBoundingCoordinate>\n<NorthBoundingCoordinate>90</NorthBoundingCoordinate>\n<EastBoundingCoordinate>180</EastBoundingCoordinate>\n<SouthBoundingCoordinate>-90</SouthBoundingCoordinate></BoundingRectangle></Geometry></HorizontalSpatialDomain>\n<GranuleSpatialRepresentation>CARTESIAN</GranuleSpatialRepresentation></Spatial>\n<MetadataStandardName>ECHO</MetadataStandardName>\n<MetadataStandardVersion>10</MetadataStandardVersion>\n</Collection></result></results>", :headers => {"date"=>["Tue, 21 Feb 2017 16:02:46 GMT"], "content-type"=>["application/echo10+xml; charset=utf-8"], "access-control-expose-headers"=>["CMR-Hits, CMR-Request-Id"], "access-control-allow-origin"=>["*"], "cmr-hits"=>["10554"], "cmr-took"=>["40"], "cmr-request-id"=>["5b0c8426-3a23-4025-a4d3-6d1c9024153a"], "vary"=>["Accept-Encoding, User-Agent"], "connection"=>["close"], "server"=>["Jetty(9.2.z-SNAPSHOT)"]})

    stub_request(:get, "https://cmr.sit.earthdata.nasa.gov/search/granules.echo10?concept_id=G309210-GHRC").
      with(
        headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Ruby'
        }).
      to_return(status: 200, body: '<?xml version="1.0" encoding="UTF-8"?><results><hits>0</hits><took>29</took></results>', headers: {})


    get :show, id: 1, record_id: 1
    assert_select "span[class='indicator_for_granule_deleted_in_cmr']", count:2, :text => '[Granule Not Found in CMR]'
  end

  it "detects if a new granule revision is available" do
    sign_in(user)
    stub_urs_access(user.uid, user.access_token, user.refresh_token)

    #stubbing all requests for raw_data
    stub_request(:get, "#{@cmr_base_url}/search/collections.echo10?concept_id=C1000000020-LANCEAMSR2").with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).to_return(:status => 200, :body => "<?xml version=\"1.0\" encoding=\"UTF-8\"?><results><hits>1</hits><took>14</took><result concept-id=\"C1000000020-LANCEAMSR2\" revision-id=\"9\" format=\"application/echo10+xml\">\n<Collection>\n<ShortName>A2_DySno_NRT</ShortName>\n<VersionId>0</VersionId>\n<InsertTime>2015-05-01T13:26:43Z</InsertTime>\n<LastUpdate>2015-09-14T13:26:43Z</LastUpdate>\n<LongName>NRT AMSR2 DAILY L3 GLOBAL SNOW WATER EQUIVALENT EASE-GRIDS</LongName>\n<DataSetId>NRT AMSR2 DAILY L3 GLOBAL SNOW WATER EQUIVALENT EASE-GRIDS V0</DataSetId>\n<Description>The Advanced Microwave Scanning Radiometer 2 (AMSR2) instrument on the Global Change Observation Mission - Water 1 (GCOM-W1) provides global passive microwave measurements of terrestrial, oceanic, and atmospheric parameters for the investigation of global water and energy cycles.  Near real-time (NRT) products are generated within 3 hours of the last observations in the file, by the Land Atmosphere Near real-time Capability for EOS (LANCE) at the AMSR Science Investigator-led Processing System (AMSR SIPS), which is collocated with the Global Hydrology Resource Center (GHRC) DAAC.  The GCOM-W1 AMSR2 Level-3 Snow Water Equivalent (SWE) data set contains snow water equivalent (SWE) data and quality assurance flags mapped to Northern and Southern Hemisphere 25 km Equal-Area Scalable Earth Grids (EASE-Grids).  Data are stored in HDF-EOS5 format and are available via HTTP from the EOSDIS LANCE system at https://lance.nsstc.nasa.gov/amsr2-science/data/level3/daysnow/R00/hdfeos5/.  If data latency is not a primary concern, please consider using science quality products.  Science products are created using the best available ancillary, calibration and ephemeris information.  Science quality products are an internally consistent, well-calibrated record of the Earth's geophysical properties to support science.  The AMSR SIPS plans to start producing initial AMSR2 standard science quality data products in late 2015 and they will be available from the NSIDC DAAC.  Notice: All LANCE AMSR2 data should be used with the understanding that these are preliminary products.  Cross calibration with AMSR-E products has not been performed.  As updates are made to the L1R data set, those changes will be reflected in this higher level product.</Description>\n<CollectionDataType>NEAR_REAL_TIME</CollectionDataType>\n<Orderable>false</Orderable>\n<Visible>true</Visible>\n<ProcessingLevelId>3</ProcessingLevelId>\n<ArchiveCenter>GHRC</ArchiveCenter>\n<CitationForExternalPublication>Tedesco, M., J. Jeyaratnam, and R. Kelly. 2015. NRT AMSR2 Daily L3 Global Snow Water Equivalent EASE-Grids [indicate subset used]. Dataset available online, [https://lance.nsstc.nasa.gov/amsr2-science/data/level3/daysnow/R00/hdfeos5/] from NASA LANCE AMSR2 at the GHRC DAAC Huntsville, Alabama, U.S.A. doi: http://dx.doi.org/10.5067/AMSR2/A2_DySno_NRT</CitationForExternalPublication><Price>0.0</Price><SpatialKeywords>\n<Keyword>GLOBAL</Keyword></SpatialKeywords><TemporalKeywords>\n<Keyword>DAILY</Keyword></TemporalKeywords><Temporal><RangeDateTime>\n<BeginningDateTime>2015-05-01T00:00:00Z</BeginningDateTime></RangeDateTime></Temporal><Contacts><Contact>\n<Role>GHRC USER SERVICES</Role><OrganizationEmails>\n<Email>ghrc-dmg@itsc.uah.edu</Email></OrganizationEmails></Contact></Contacts><ScienceKeywords><ScienceKeyword>\n<CategoryKeyword>EARTH SCIENCE</CategoryKeyword>\n<TopicKeyword>CRYOSPHERE</TopicKeyword>\n<TermKeyword>SNOW/ICE</TermKeyword><VariableLevel1Keyword>\n<Value>SNOW WATER EQUIVALENT</Value></VariableLevel1Keyword></ScienceKeyword><ScienceKeyword>\n<CategoryKeyword>EARTH SCIENCE</CategoryKeyword>\n<TopicKeyword>TERRESTRIAL HYDROSPHERE</TopicKeyword>\n<TermKeyword>SNOW/ICE</TermKeyword><VariableLevel1Keyword>\n<Value>SNOW WATER EQUIVALENT</Value></VariableLevel1Keyword></ScienceKeyword></ScienceKeywords><Platforms><Platform>\n<ShortName>GCOM-W1</ShortName>\n<LongName>GCOM-W1</LongName>\n<Type>SATELLITE</Type><Instruments><Instrument>\n<ShortName>AMSR2</ShortName><Sensors><Sensor>\n<ShortName>AMSR2</ShortName></Sensor></Sensors></Instrument></Instruments></Platform></Platforms>\n<AdditionalAttributes>\n<AdditionalAttribute>\n<Name>identifier_product_doi</Name>\n<DataType>STRING</DataType>\n<Description>product DOI</Description>\n<Value>10.5067/AMSR2/A2_DySno_NRT</Value>\n</AdditionalAttribute>\n<AdditionalAttribute>\n<Name>identifier_product_doi_authority</Name>\n<DataType>STRING</DataType>\n<Description>DOI authority</Description>\n<Value>http://dx.doi.org</Value>\n</AdditionalAttribute>\n</AdditionalAttributes>\n<Campaigns><Campaign>\n<ShortName>LANCE</ShortName></Campaign></Campaigns><OnlineAccessURLs><OnlineAccessURL>\n<URL>https://lance.nsstc.nasa.gov/amsr2-science/data/level3/daysnow/R00/hdfeos5/</URL><URLDescription></URLDescription><MimeType></MimeType></OnlineAccessURL></OnlineAccessURLs><OnlineResources><OnlineResource>\n<URL>https://lance.itsc.uah.edu/amsr2-science/data/level3/daysnow/R00/hdfeos5/</URL><Description></Description>\n<Type>Alternate Data Access</Type></OnlineResource><OnlineResource>\n<URL>https://lance.nsstc.nasa.gov/amsr2-science/browse_png/level3/daysnow/R00/</URL><Description></Description>\n<Type>Browse</Type></OnlineResource><OnlineResource>\n<URL>https://worldview.earthdata.nasa.gov/</URL><Description></Description>\n<Type>Worldview Imagery</Type></OnlineResource><OnlineResource>\n<URL>http://lance.nsstc.nasa.gov/</URL><Description></Description>\n<Type>Homepage</Type></OnlineResource><OnlineResource>\n<URL>http://lance.nsstc.nasa.gov/amsr2-science/doc/LANCE_A2_DySno_NRT_dataset.pdf</URL><Description></Description>\n<Type>Guide</Type></OnlineResource><OnlineResource>\n<URL>http://dx.doi.org/10.5067/AMSR2/A2_DySno_NRT</URL><Description></Description>\n<Type>DOI</Type></OnlineResource><OnlineResource>\n<URL>http://ghrc.nsstc.nasa.gov/uso/citation.html</URL><Description></Description>\n<Type>Citing GHRC Data</Type></OnlineResource></OnlineResources><AssociatedDIFs><DIF>\n<EntryId>A2_DySno_NRT</EntryId></DIF></AssociatedDIFs><Spatial><SpatialCoverageType>Horizontal</SpatialCoverageType><HorizontalSpatialDomain><Geometry>\n<CoordinateSystem>CARTESIAN</CoordinateSystem><BoundingRectangle>\n<WestBoundingCoordinate>-180</WestBoundingCoordinate>\n<NorthBoundingCoordinate>90</NorthBoundingCoordinate>\n<EastBoundingCoordinate>180</EastBoundingCoordinate>\n<SouthBoundingCoordinate>-90</SouthBoundingCoordinate></BoundingRectangle></Geometry></HorizontalSpatialDomain>\n<GranuleSpatialRepresentation>CARTESIAN</GranuleSpatialRepresentation></Spatial>\n<MetadataStandardName>ECHO</MetadataStandardName>\n<MetadataStandardVersion>10</MetadataStandardVersion>\n</Collection></result></results>", :headers => {"date"=>["Tue, 21 Feb 2017 16:02:46 GMT"], "content-type"=>["application/echo10+xml; charset=utf-8"], "access-control-expose-headers"=>["CMR-Hits, CMR-Request-Id"], "access-control-allow-origin"=>["*"], "cmr-hits"=>["10554"], "cmr-took"=>["40"], "cmr-request-id"=>["5b0c8426-3a23-4025-a4d3-6d1c9024153a"], "vary"=>["Accept-Encoding, User-Agent"], "connection"=>["close"], "server"=>["Jetty(9.2.z-SNAPSHOT)"]})

    stub_request(:get, "https://cmr.sit.earthdata.nasa.gov/search/granules.echo10?concept_id=G309210-GHRC").
      with(
        headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Ruby'
        }).
      to_return(status: 200, body: '<?xml version="1.0" encoding="UTF-8"?><results><hits>1</hits><took>29</took><result concept-id="G1581545525-LANCEAMSR2" collection-concept-id="C1000000020-LANCEAMSR2" revision-id="15" format="application/echo10+xml">
    <Granule>
      <GranuleUR>AMSR_2_L3_DailySnow_P00_20190102.he5</GranuleUR>
      <InsertTime>2019-01-03T02:14:37Z</InsertTime>
      <LastUpdate>2019-01-03T02:14:37Z</LastUpdate>
      <DeleteTime>2019-01-16T23:59:59.999Z</DeleteTime>
      <Collection>
        <ShortName>A2_DySno_NRT</ShortName>
        <VersionId>0</VersionId>
      </Collection>
      <DataGranule>
        <DayNightFlag>BOTH</DayNightFlag>
        <ProductionDateTime>2019-01-03T02:14:37Z</ProductionDateTime>
        <LocalVersionId>P00</LocalVersionId>
      </DataGranule>
      <PGEVersionClass>
        <PGEName>DailySnow</PGEName>
        <PGEVersion>00</PGEVersion>
      </PGEVersionClass>
      <Temporal>
        <RangeDateTime>
          <BeginningDateTime>2019-01-02T00:26:32Z</BeginningDateTime>
          <EndingDateTime>2019-01-03T00:14:57Z</EndingDateTime>
        </RangeDateTime>
      </Temporal>
        <Spatial>
          <HorizontalSpatialDomain>
            <Geometry>
              <BoundingRectangle>
                <WestBoundingCoordinate>-180.0</WestBoundingCoordinate>
                <NorthBoundingCoordinate>90.0</NorthBoundingCoordinate>
                <EastBoundingCoordinate>180.0</EastBoundingCoordinate>
                <SouthBoundingCoordinate>-90.0</SouthBoundingCoordinate>
              </BoundingRectangle>
            </Geometry>
          </HorizontalSpatialDomain>
        </Spatial>
      <MeasuredParameters>
        <MeasuredParameter>
          <ParameterName>Snow Water Equivalent</ParameterName>
        </MeasuredParameter>
      </MeasuredParameters>
      <AdditionalAttributes>
        <AdditionalAttribute>
          <Name>identifier_product_doi</Name>
          <Values>
            <Value>10.5067/AMSR2/A2_DySno_NRT</Value>
          </Values>
        </AdditionalAttribute>
        <AdditionalAttribute>
          <Name>identifier_product_doi_authority</Name>
          <Values>
            <Value>http://dx.doi.org</Value>
          </Values>
        </AdditionalAttribute>
      </AdditionalAttributes>
      <InputGranules>
        <InputGranule>(GW1AM2_201901020026_185D_L1SNRTBR_2220220.h5</InputGranule>
      </InputGranules>
      <OnlineAccessURLs>
        <OnlineAccessURL>
          <URL>https://lance.nsstc.nasa.gov/amsr2-science/data/level3/daysnow/R00/hdfeos5/AMSR_2_L3_DailySnow_P00_20190102.he5</URL>
          <URLDescription>Online access to AMSR-2 Near-Real-Time LANCE Products (primary)</URLDescription>
        </OnlineAccessURL>
        <OnlineAccessURL>
          <URL>https://lance.itsc.uah.edu/amsr2-science/data/level3/daysnow/R00/hdfeos5/AMSR_2_L3_DailySnow_P00_20190102.he5</URL>
          <URLDescription>Online access to AMSR-2 Near-Real-Time LANCE Products (backup)</URLDescription>
        </OnlineAccessURL>
      </OnlineAccessURLs>
      <OnlineResources>
        <OnlineResource>
          <URL>http://dx.doi.org/10.5067/AMSR2/A2_DySno_NRT</URL>
          <Type>Data Object Identifier</Type>
        </OnlineResource>
      </OnlineResources>
      <Orderable>true</Orderable>
      <DataFormat>HDF-EOS 5</DataFormat>
    </Granule></result></results>', headers: {})

    get :show, id: 1, record_id: 1
    assert_select '#ingest_pull_latest', count:2
  end
end



describe "POST #create" do
    it "downloads and saves a new record" do
      sign_in(user)
      stub_urs_access(user.uid, user.access_token, user.refresh_token)

      stub_request(:get, Regexp.new("#{Regexp.escape(@cmr_base_url)}\\/search\\/collections\\.(echo10|native)\\?concept_id\\=C222702\\-GHRC")).with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).to_return(:status => 200, :body => "<?xml version=\"1.0\" encoding=\"UTF-8\"?><results><hits>1</hits><took>2973</took><result concept-id=\"C222702-GHRC\" revision-id=\"32\" format=\"application/echo10+xml\"><Collection><ShortName>daylightn</ShortName><VersionId>1</VersionId><InsertTime>1988-01-01T00:00:00.000Z</InsertTime><LastUpdate>2012-01-07T14:34:28.000Z</LastUpdate><LongName>US COMPOSITE LIGHTNING DAILY TOTAL FROM NATL LIGHTNING NETWORK</LongName><DataSetId>US COMPOSITE LIGHTNING DAILY TOTAL FROM NATL LIGHTNING NETWORK V1</DataSetId><Description>The Global Hydrology Resource Center generates a cloud-to-ground lightning product from the data collected from the U.S. National Lightning Detection Network, a commercial lightning detection network operated by Global Atmospherics, Inc. (GAI), formerly Geomet Data Services. The daily products are produced by binning the number of flashes occurring in each pixel (pixel is approximately 8 km by 8 km) during a 24 hr period (00 UTC to 00 UTC). The data set begins on July 8, 1994 and continues through the present.</Description><Orderable>false</Orderable><Visible>true</Visible><ProcessingLevelId>3</ProcessingLevelId><ArchiveCenter>GHRC</ArchiveCenter><Price>0</Price><SpatialKeywords><Keyword>CONUS</Keyword></SpatialKeywords><TemporalKeywords><Keyword>DAILY TOTAL</Keyword></TemporalKeywords><Temporal><RangeDateTime><BeginningDateTime>1988-01-01T00:00:00.000Z</BeginningDateTime></RangeDateTime></Temporal><Contacts><Contact><Role>GHRC USER SERVICES</Role><OrganizationAddresses /><OrganizationPhones /><OrganizationEmails><Email>ghrc-dmg@itsc.uah.edu</Email></OrganizationEmails><ContactPersons /></Contact></Contacts><ScienceKeywords><ScienceKeyword><CategoryKeyword>EARTH SCIENCE</CategoryKeyword><TopicKeyword>ATMOSPHERE</TopicKeyword><TermKeyword>ATMOSPHERIC ELECTRICITY</TermKeyword><VariableLevel1Keyword><Value>LIGHTNING</Value></VariableLevel1Keyword></ScienceKeyword><ScienceKeyword><CategoryKeyword>EARTH SCIENCE</CategoryKeyword><TopicKeyword>ATMOSPHERE</TopicKeyword><TermKeyword>ATMOSPHERIC PHENOMENA</TermKeyword><VariableLevel1Keyword><Value>LIGHTNING</Value></VariableLevel1Keyword></ScienceKeyword></ScienceKeywords><Platforms><Platform><ShortName>NATIONAL LIGHTNING DETECTION NETWORK</ShortName><LongName>NATIONAL LIGHTNING DETECTION NETWORK</LongName><Type>GROUND BASED NETWORK</Type><Characteristics /><Instruments><Instrument><ShortName>RF ANTENNA</ShortName><Characteristics /><Sensors><Sensor><ShortName>RF ANTENNA</ShortName><Characteristics /></Sensor></Sensors><OperationModes /></Instrument></Instruments></Platform></Platforms><AdditionalAttributes /><CSDTDescriptions /><CollectionAssociations /><Campaigns><Campaign><ShortName>LIS</ShortName></Campaign></Campaigns><AlgorithmPackages /><TwoDCoordinateSystems /><OnlineAccessURLs /><OnlineResources><OnlineResource><URL>http://lightning.nsstc.nasa.gov/cgi-bin/nldn/nldn_cal.pl?1998+January</URL><Type>Browse</Type></OnlineResource><OnlineResource><URL>http://ghrc.nsstc.nasa.gov/uso/ds_docs/nldn/lightning_dataset.html</URL><Type>Guide</Type></OnlineResource><OnlineResource><URL>http://lightning.nsstc.nasa.gov/data/</URL><Type>Homepage</Type></OnlineResource></OnlineResources><AssociatedDIFs><DIF><EntryId>daylightn</EntryId></DIF></AssociatedDIFs><Spatial><SpatialCoverageType>Horizontal</SpatialCoverageType><HorizontalSpatialDomain><Geometry><CoordinateSystem>CARTESIAN</CoordinateSystem><BoundingRectangle><WestBoundingCoordinate>-130</WestBoundingCoordinate><NorthBoundingCoordinate>53</NorthBoundingCoordinate><EastBoundingCoordinate>-60</EastBoundingCoordinate><SouthBoundingCoordinate>20</SouthBoundingCoordinate></BoundingRectangle></Geometry></HorizontalSpatialDomain><GranuleSpatialRepresentation>CARTESIAN</GranuleSpatialRepresentation></Spatial></Collection></result></results>", :headers => {"date"=>["Tue, 21 Feb 2017 15:50:04 GMT"], "content-type"=>["application/echo10+xml; charset=utf-8"], "access-control-expose-headers"=>["CMR-Hits, CMR-Request-Id"], "access-control-allow-origin"=>["*"], "cmr-hits"=>["1"], "cmr-took"=>["2974"], "cmr-request-id"=>["bb005bac-18ce-4b6a-b69f-3f29f820ced5"], "vary"=>["Accept-Encoding, User-Agent"], "connection"=>["close"], "server"=>["Jetty(9.2.z-SNAPSHOT)"]})
      #stubbing the new format check
      stub_request(:get, "#{@cmr_base_url}/search/collections.atom?concept_id=C222702-GHRC").with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).to_return(:status => 200, :body => "<?xml version=\"1.0\" encoding=\"UTF-8\"?><feed xmlns:os=\"http://a9.com/-/spec/opensearch/1.1/\" xmlns:georss=\"http://www.georss.org/georss/10\" xmlns=\"http://www.w3.org/2005/Atom\" xmlns:dc=\"http://purl.org/dc/terms/\" xmlns:echo=\"http://www.echo.nasa.gov/esip\" xmlns:esipdiscovery=\"http://commons.esipfed.org/ns/discovery/1.2/\" xmlns:gml=\"http://www.opengis.net/gml\" esipdiscovery:version=\"1.2\" xmlns:time=\"http://a9.com/-/opensearch/extensions/time/1.0/\"><entry><echo:originalFormat>ECHO10</echo:originalFormat></entry></feed>", :headers => {"date"=>["Fri, 17 Mar 2017 20:00:54 GMT"], "content-type"=>["application/echo10+xml; charset=utf-8"], "access-control-expose-headers"=>["CMR-Hits, CMR-Request-Id"], "access-control-allow-origin"=>["*"], "cmr-hits"=>["1"], "cmr-took"=>["107"], "cmr-request-id"=>["308d3b81-b229-4593-a05e-c61a741d45be"], "vary"=>["Accept-Encoding, User-Agent"], "connection"=>["close"], "server"=>["Jetty(9.2.z-SNAPSHOT)"], "strict-transport-security"=>["max-age=31536000"]})

      #Since a granule is chosen at random, a full mock can not be used.
      #in this instance, we return a set collection of results for any call using this concept id and granule keyword.
      stub_request(:get, /.*granules.*C222702-GHRC.*/).with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).to_return(:status => 200, :body => "<?xml version=\"1.0\" encoding=\"UTF-8\"?><results><hits>10554</hits><took>39</took><result concept-id=\"G309203-GHRC\" collection-concept-id=\"C222702-GHRC\" revision-id=\"1\" format=\"application/echo10+xml\"><Granule><GranuleUR>Ndaily1988.003_cum_cglitn_v1.hdf</GranuleUR><InsertTime>2009-12-05T12:05:32.000Z</InsertTime><LastUpdate>2009-12-05T12:05:32.000Z</LastUpdate><Collection><ShortName>daylightn</ShortName><VersionId>1</VersionId></Collection><DataGranule><SizeMBDataGranule>0.402057647705078</SizeMBDataGranule><DayNightFlag>UNSPECIFIED</DayNightFlag><ProductionDateTime>2009-12-05T12:05:32.000Z</ProductionDateTime></DataGranule><Temporal><RangeDateTime><BeginningDateTime>1988-01-03T00:00:00.000Z</BeginningDateTime><EndingDateTime>1988-01-03T23:59:59.000Z</EndingDateTime></RangeDateTime></Temporal><Spatial><HorizontalSpatialDomain><Geometry><BoundingRectangle><WestBoundingCoordinate>-130</WestBoundingCoordinate><NorthBoundingCoordinate>53</NorthBoundingCoordinate><EastBoundingCoordinate>-60</EastBoundingCoordinate><SouthBoundingCoordinate>20</SouthBoundingCoordinate></BoundingRectangle></Geometry></HorizontalSpatialDomain></Spatial><Price>0</Price><OnlineResources><OnlineResource><URL>http://lightning.nsstc.nasa.gov/cgi-bin/nldn/nldn_cal.pl?1998+January</URL><Type>Browse</Type></OnlineResource><OnlineResource><URL>http://ghrc.nsstc.nasa.gov/uso/ds_docs/nldn/lightning_dataset.html</URL><Type>Guide</Type></OnlineResource><OnlineResource><URL>http://lightning.nsstc.nasa.gov/data/</URL><Type>Homepage</Type></OnlineResource></OnlineResources><Orderable>true</Orderable><DataFormat>HDF</DataFormat><Visible>true</Visible></Granule></result><result concept-id=\"G309204-GHRC\" collection-concept-id=\"C222702-GHRC\" revision-id=\"1\" format=\"application/echo10+xml\"><Granule><GranuleUR>Ndaily1988.004_cum_cglitn_v1.hdf</GranuleUR><InsertTime>2009-12-05T12:05:32.000Z</InsertTime><LastUpdate>2009-12-05T12:05:32.000Z</LastUpdate><Collection><ShortName>daylightn</ShortName><VersionId>1</VersionId></Collection><DataGranule><SizeMBDataGranule>0.402057647705078</SizeMBDataGranule><DayNightFlag>UNSPECIFIED</DayNightFlag><ProductionDateTime>2009-12-05T12:05:32.000Z</ProductionDateTime></DataGranule><Temporal><RangeDateTime><BeginningDateTime>1988-01-04T00:00:00.000Z</BeginningDateTime><EndingDateTime>1988-01-04T23:59:59.000Z</EndingDateTime></RangeDateTime></Temporal><Spatial><HorizontalSpatialDomain><Geometry><BoundingRectangle><WestBoundingCoordinate>-130</WestBoundingCoordinate><NorthBoundingCoordinate>53</NorthBoundingCoordinate><EastBoundingCoordinate>-60</EastBoundingCoordinate><SouthBoundingCoordinate>20</SouthBoundingCoordinate></BoundingRectangle></Geometry></HorizontalSpatialDomain></Spatial><Price>0</Price><OnlineResources><OnlineResource><URL>http://lightning.nsstc.nasa.gov/cgi-bin/nldn/nldn_cal.pl?1998+January</URL><Type>Browse</Type></OnlineResource><OnlineResource><URL>http://ghrc.nsstc.nasa.gov/uso/ds_docs/nldn/lightning_dataset.html</URL><Type>Guide</Type></OnlineResource><OnlineResource><URL>http://lightning.nsstc.nasa.gov/data/</URL><Type>Homepage</Type></OnlineResource></OnlineResources><Orderable>true</Orderable><DataFormat>HDF</DataFormat><Visible>true</Visible></Granule></result><result concept-id=\"G309205-GHRC\" collection-concept-id=\"C222702-GHRC\" revision-id=\"1\" format=\"application/echo10+xml\"><Granule><GranuleUR>Ndaily1988.005_cum_cglitn_v1.hdf</GranuleUR><InsertTime>2009-12-05T12:05:32.000Z</InsertTime><LastUpdate>2009-12-05T12:05:32.000Z</LastUpdate><Collection><ShortName>daylightn</ShortName><VersionId>1</VersionId></Collection><DataGranule><SizeMBDataGranule>0.402057647705078</SizeMBDataGranule><DayNightFlag>UNSPECIFIED</DayNightFlag><ProductionDateTime>2009-12-05T12:05:32.000Z</ProductionDateTime></DataGranule><Temporal><RangeDateTime><BeginningDateTime>1988-01-05T00:00:00.000Z</BeginningDateTime><EndingDateTime>1988-01-05T23:59:59.000Z</EndingDateTime></RangeDateTime></Temporal><Spatial><HorizontalSpatialDomain><Geometry><BoundingRectangle><WestBoundingCoordinate>-130</WestBoundingCoordinate><NorthBoundingCoordinate>53</NorthBoundingCoordinate><EastBoundingCoordinate>-60</EastBoundingCoordinate><SouthBoundingCoordinate>20</SouthBoundingCoordinate></BoundingRectangle></Geometry></HorizontalSpatialDomain></Spatial><Price>0</Price><OnlineResources><OnlineResource><URL>http://lightning.nsstc.nasa.gov/cgi-bin/nldn/nldn_cal.pl?1998+January</URL><Type>Browse</Type></OnlineResource><OnlineResource><URL>http://ghrc.nsstc.nasa.gov/uso/ds_docs/nldn/lightning_dataset.html</URL><Type>Guide</Type></OnlineResource><OnlineResource><URL>http://lightning.nsstc.nasa.gov/data/</URL><Type>Homepage</Type></OnlineResource></OnlineResources><Orderable>true</Orderable><DataFormat>HDF</DataFormat><Visible>true</Visible></Granule></result><result concept-id=\"G309206-GHRC\" collection-concept-id=\"C222702-GHRC\" revision-id=\"1\" format=\"application/echo10+xml\"><Granule><GranuleUR>Ndaily1988.006_cum_cglitn_v1.hdf</GranuleUR><InsertTime>2009-12-05T12:05:32.000Z</InsertTime><LastUpdate>2009-12-05T12:05:32.000Z</LastUpdate><Collection><ShortName>daylightn</ShortName><VersionId>1</VersionId></Collection><DataGranule><SizeMBDataGranule>0.402057647705078</SizeMBDataGranule><DayNightFlag>UNSPECIFIED</DayNightFlag><ProductionDateTime>2009-12-05T12:05:32.000Z</ProductionDateTime></DataGranule><Temporal><RangeDateTime><BeginningDateTime>1988-01-06T00:00:00.000Z</BeginningDateTime><EndingDateTime>1988-01-06T23:59:59.000Z</EndingDateTime></RangeDateTime></Temporal><Spatial><HorizontalSpatialDomain><Geometry><BoundingRectangle><WestBoundingCoordinate>-130</WestBoundingCoordinate><NorthBoundingCoordinate>53</NorthBoundingCoordinate><EastBoundingCoordinate>-60</EastBoundingCoordinate><SouthBoundingCoordinate>20</SouthBoundingCoordinate></BoundingRectangle></Geometry></HorizontalSpatialDomain></Spatial><Price>0</Price><OnlineResources><OnlineResource><URL>http://lightning.nsstc.nasa.gov/cgi-bin/nldn/nldn_cal.pl?1998+January</URL><Type>Browse</Type></OnlineResource><OnlineResource><URL>http://ghrc.nsstc.nasa.gov/uso/ds_docs/nldn/lightning_dataset.html</URL><Type>Guide</Type></OnlineResource><OnlineResource><URL>http://lightning.nsstc.nasa.gov/data/</URL><Type>Homepage</Type></OnlineResource></OnlineResources><Orderable>true</Orderable><DataFormat>HDF</DataFormat><Visible>true</Visible></Granule></result><result concept-id=\"G309207-GHRC\" collection-concept-id=\"C222702-GHRC\" revision-id=\"1\" format=\"application/echo10+xml\"><Granule><GranuleUR>Ndaily1988.007_cum_cglitn_v1.hdf</GranuleUR><InsertTime>2009-12-05T12:05:32.000Z</InsertTime><LastUpdate>2009-12-05T12:05:32.000Z</LastUpdate><Collection><ShortName>daylightn</ShortName><VersionId>1</VersionId></Collection><DataGranule><SizeMBDataGranule>0.402057647705078</SizeMBDataGranule><DayNightFlag>UNSPECIFIED</DayNightFlag><ProductionDateTime>2009-12-05T12:05:32.000Z</ProductionDateTime></DataGranule><Temporal><RangeDateTime><BeginningDateTime>1988-01-07T00:00:00.000Z</BeginningDateTime><EndingDateTime>1988-01-07T23:59:59.000Z</EndingDateTime></RangeDateTime></Temporal><Spatial><HorizontalSpatialDomain><Geometry><BoundingRectangle><WestBoundingCoordinate>-130</WestBoundingCoordinate><NorthBoundingCoordinate>53</NorthBoundingCoordinate><EastBoundingCoordinate>-60</EastBoundingCoordinate><SouthBoundingCoordinate>20</SouthBoundingCoordinate></BoundingRectangle></Geometry></HorizontalSpatialDomain></Spatial><Price>0</Price><OnlineResources><OnlineResource><URL>http://lightning.nsstc.nasa.gov/cgi-bin/nldn/nldn_cal.pl?1998+January</URL><Type>Browse</Type></OnlineResource><OnlineResource><URL>http://ghrc.nsstc.nasa.gov/uso/ds_docs/nldn/lightning_dataset.html</URL><Type>Guide</Type></OnlineResource><OnlineResource><URL>http://lightning.nsstc.nasa.gov/data/</URL><Type>Homepage</Type></OnlineResource></OnlineResources><Orderable>true</Orderable><DataFormat>HDF</DataFormat><Visible>true</Visible></Granule></result><result concept-id=\"G309208-GHRC\" collection-concept-id=\"C222702-GHRC\" revision-id=\"1\" format=\"application/echo10+xml\"><Granule><GranuleUR>Ndaily1988.008_cum_cglitn_v1.hdf</GranuleUR><InsertTime>2009-12-05T12:05:32.000Z</InsertTime><LastUpdate>2009-12-05T12:05:32.000Z</LastUpdate><Collection><ShortName>daylightn</ShortName><VersionId>1</VersionId></Collection><DataGranule><SizeMBDataGranule>0.402057647705078</SizeMBDataGranule><DayNightFlag>UNSPECIFIED</DayNightFlag><ProductionDateTime>2009-12-05T12:05:32.000Z</ProductionDateTime></DataGranule><Temporal><RangeDateTime><BeginningDateTime>1988-01-08T00:00:00.000Z</BeginningDateTime><EndingDateTime>1988-01-08T23:59:59.000Z</EndingDateTime></RangeDateTime></Temporal><Spatial><HorizontalSpatialDomain><Geometry><BoundingRectangle><WestBoundingCoordinate>-130</WestBoundingCoordinate><NorthBoundingCoordinate>53</NorthBoundingCoordinate><EastBoundingCoordinate>-60</EastBoundingCoordinate><SouthBoundingCoordinate>20</SouthBoundingCoordinate></BoundingRectangle></Geometry></HorizontalSpatialDomain></Spatial><Price>0</Price><OnlineResources><OnlineResource><URL>http://lightning.nsstc.nasa.gov/cgi-bin/nldn/nldn_cal.pl?1998+January</URL><Type>Browse</Type></OnlineResource><OnlineResource><URL>http://ghrc.nsstc.nasa.gov/uso/ds_docs/nldn/lightning_dataset.html</URL><Type>Guide</Type></OnlineResource><OnlineResource><URL>http://lightning.nsstc.nasa.gov/data/</URL><Type>Homepage</Type></OnlineResource></OnlineResources><Orderable>true</Orderable><DataFormat>HDF</DataFormat><Visible>true</Visible></Granule></result><result concept-id=\"G309209-GHRC\" collection-concept-id=\"C222702-GHRC\" revision-id=\"1\" format=\"application/echo10+xml\"><Granule><GranuleUR>Ndaily1988.009_cum_cglitn_v1.hdf</GranuleUR><InsertTime>2009-12-05T12:05:32.000Z</InsertTime><LastUpdate>2009-12-05T12:05:32.000Z</LastUpdate><Collection><ShortName>daylightn</ShortName><VersionId>1</VersionId></Collection><DataGranule><SizeMBDataGranule>0.402057647705078</SizeMBDataGranule><DayNightFlag>UNSPECIFIED</DayNightFlag><ProductionDateTime>2009-12-05T12:05:32.000Z</ProductionDateTime></DataGranule><Temporal><RangeDateTime><BeginningDateTime>1988-01-09T00:00:00.000Z</BeginningDateTime><EndingDateTime>1988-01-09T23:59:59.000Z</EndingDateTime></RangeDateTime></Temporal><Spatial><HorizontalSpatialDomain><Geometry><BoundingRectangle><WestBoundingCoordinate>-130</WestBoundingCoordinate><NorthBoundingCoordinate>53</NorthBoundingCoordinate><EastBoundingCoordinate>-60</EastBoundingCoordinate><SouthBoundingCoordinate>20</SouthBoundingCoordinate></BoundingRectangle></Geometry></HorizontalSpatialDomain></Spatial><Price>0</Price><OnlineResources><OnlineResource><URL>http://lightning.nsstc.nasa.gov/cgi-bin/nldn/nldn_cal.pl?1998+January</URL><Type>Browse</Type></OnlineResource><OnlineResource><URL>http://ghrc.nsstc.nasa.gov/uso/ds_docs/nldn/lightning_dataset.html</URL><Type>Guide</Type></OnlineResource><OnlineResource><URL>http://lightning.nsstc.nasa.gov/data/</URL><Type>Homepage</Type></OnlineResource></OnlineResources><Orderable>true</Orderable><DataFormat>HDF</DataFormat><Visible>true</Visible></Granule></result><result concept-id=\"G309210-GHRC\" collection-concept-id=\"C222702-GHRC\" revision-id=\"1\" format=\"application/echo10+xml\"><Granule><GranuleUR>Ndaily1988.010_cum_cglitn_v1.hdf</GranuleUR><InsertTime>2009-12-05T12:05:32.000Z</InsertTime><LastUpdate>2009-12-05T12:05:32.000Z</LastUpdate><Collection><ShortName>daylightn</ShortName><VersionId>1</VersionId></Collection><DataGranule><SizeMBDataGranule>0.402057647705078</SizeMBDataGranule><DayNightFlag>UNSPECIFIED</DayNightFlag><ProductionDateTime>2009-12-05T12:05:32.000Z</ProductionDateTime></DataGranule><Temporal><RangeDateTime><BeginningDateTime>1988-01-10T00:00:00.000Z</BeginningDateTime><EndingDateTime>1988-01-10T23:59:59.000Z</EndingDateTime></RangeDateTime></Temporal><Spatial><HorizontalSpatialDomain><Geometry><BoundingRectangle><WestBoundingCoordinate>-130</WestBoundingCoordinate><NorthBoundingCoordinate>53</NorthBoundingCoordinate><EastBoundingCoordinate>-60</EastBoundingCoordinate><SouthBoundingCoordinate>20</SouthBoundingCoordinate></BoundingRectangle></Geometry></HorizontalSpatialDomain></Spatial><Price>0</Price><OnlineResources><OnlineResource><URL>http://lightning.nsstc.nasa.gov/cgi-bin/nldn/nldn_cal.pl?1998+January</URL><Type>Browse</Type></OnlineResource><OnlineResource><URL>http://ghrc.nsstc.nasa.gov/uso/ds_docs/nldn/lightning_dataset.html</URL><Type>Guide</Type></OnlineResource><OnlineResource><URL>http://lightning.nsstc.nasa.gov/data/</URL><Type>Homepage</Type></OnlineResource></OnlineResources><Orderable>true</Orderable><DataFormat>HDF</DataFormat><Visible>true</Visible></Granule></result><result concept-id=\"G309211-GHRC\" collection-concept-id=\"C222702-GHRC\" revision-id=\"1\" format=\"application/echo10+xml\"><Granule><GranuleUR>Ndaily1988.011_cum_cglitn_v1.hdf</GranuleUR><InsertTime>2009-12-05T12:05:32.000Z</InsertTime><LastUpdate>2009-12-05T12:05:32.000Z</LastUpdate><Collection><ShortName>daylightn</ShortName><VersionId>1</VersionId></Collection><DataGranule><SizeMBDataGranule>0.402057647705078</SizeMBDataGranule><DayNightFlag>UNSPECIFIED</DayNightFlag><ProductionDateTime>2009-12-05T12:05:32.000Z</ProductionDateTime></DataGranule><Temporal><RangeDateTime><BeginningDateTime>1988-01-11T00:00:00.000Z</BeginningDateTime><EndingDateTime>1988-01-11T23:59:59.000Z</EndingDateTime></RangeDateTime></Temporal><Spatial><HorizontalSpatialDomain><Geometry><BoundingRectangle><WestBoundingCoordinate>-130</WestBoundingCoordinate><NorthBoundingCoordinate>53</NorthBoundingCoordinate><EastBoundingCoordinate>-60</EastBoundingCoordinate><SouthBoundingCoordinate>20</SouthBoundingCoordinate></BoundingRectangle></Geometry></HorizontalSpatialDomain></Spatial><Price>0</Price><OnlineResources><OnlineResource><URL>http://lightning.nsstc.nasa.gov/cgi-bin/nldn/nldn_cal.pl?1998+January</URL><Type>Browse</Type></OnlineResource><OnlineResource><URL>http://ghrc.nsstc.nasa.gov/uso/ds_docs/nldn/lightning_dataset.html</URL><Type>Guide</Type></OnlineResource><OnlineResource><URL>http://lightning.nsstc.nasa.gov/data/</URL><Type>Homepage</Type></OnlineResource></OnlineResources><Orderable>true</Orderable><DataFormat>HDF</DataFormat><Visible>true</Visible></Granule></result><result concept-id=\"G309212-GHRC\" collection-concept-id=\"C222702-GHRC\" revision-id=\"1\" format=\"application/echo10+xml\"><Granule><GranuleUR>Ndaily1988.012_cum_cglitn_v1.hdf</GranuleUR><InsertTime>2009-12-05T12:05:32.000Z</InsertTime><LastUpdate>2009-12-05T12:05:32.000Z</LastUpdate><Collection><ShortName>daylightn</ShortName><VersionId>1</VersionId></Collection><DataGranule><SizeMBDataGranule>0.402057647705078</SizeMBDataGranule><DayNightFlag>UNSPECIFIED</DayNightFlag><ProductionDateTime>2009-12-05T12:05:32.000Z</ProductionDateTime></DataGranule><Temporal><RangeDateTime><BeginningDateTime>1988-01-12T00:00:00.000Z</BeginningDateTime><EndingDateTime>1988-01-12T23:59:59.000Z</EndingDateTime></RangeDateTime></Temporal><Spatial><HorizontalSpatialDomain><Geometry><BoundingRectangle><WestBoundingCoordinate>-130</WestBoundingCoordinate><NorthBoundingCoordinate>53</NorthBoundingCoordinate><EastBoundingCoordinate>-60</EastBoundingCoordinate><SouthBoundingCoordinate>20</SouthBoundingCoordinate></BoundingRectangle></Geometry></HorizontalSpatialDomain></Spatial><Price>0</Price><OnlineResources><OnlineResource><URL>http://lightning.nsstc.nasa.gov/cgi-bin/nldn/nldn_cal.pl?1998+January</URL><Type>Browse</Type></OnlineResource><OnlineResource><URL>http://ghrc.nsstc.nasa.gov/uso/ds_docs/nldn/lightning_dataset.html</URL><Type>Guide</Type></OnlineResource><OnlineResource><URL>http://lightning.nsstc.nasa.gov/data/</URL><Type>Homepage</Type></OnlineResource></OnlineResources><Orderable>true</Orderable><DataFormat>HDF</DataFormat><Visible>true</Visible></Granule></result></results>", :headers => {"date"=>["Tue, 21 Feb 2017 16:02:46 GMT"], "content-type"=>["application/echo10+xml; charset=utf-8"], "access-control-expose-headers"=>["CMR-Hits, CMR-Request-Id"], "access-control-allow-origin"=>["*"], "cmr-hits"=>["10554"], "cmr-took"=>["40"], "cmr-request-id"=>["5b0c8426-3a23-4025-a4d3-6d1c9024153a"], "vary"=>["Accept-Encoding, User-Agent"], "connection"=>["close"], "server"=>["Jetty(9.2.z-SNAPSHOT)"]})

      #stubbing the granule raw look up
      stub_request(:get, /.*granules.echo10\?concept_id=G.*/).with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).to_return(:status => 200, :body => "<?xml version=\"1.0\" encoding=\"UTF-8\"?><results><hits>1</hits><took>25</took><result concept-id=\"G226250-GHRC\" collection-concept-id=\"C222702-GHRC\" revision-id=\"1\" format=\"application/echo10+xml\"><Granule><GranuleUR>Ndaily2004.246_cum_cglitn_v2.hdf</GranuleUR><InsertTime>2007-11-27T17:06:08.000Z</InsertTime><LastUpdate>2007-11-27T17:06:08.000Z</LastUpdate><Collection><ShortName>daylightn</ShortName><VersionId>1</VersionId></Collection><DataGranule><SizeMBDataGranule>0.402059555053711</SizeMBDataGranule><DayNightFlag>UNSPECIFIED</DayNightFlag><ProductionDateTime>2007-11-27T17:06:08.000Z</ProductionDateTime></DataGranule><Temporal><RangeDateTime><BeginningDateTime>2004-09-02T00:00:00.000Z</BeginningDateTime><EndingDateTime>2004-09-02T23:59:59.000Z</EndingDateTime></RangeDateTime></Temporal><Spatial><HorizontalSpatialDomain><Geometry><BoundingRectangle><WestBoundingCoordinate>-130</WestBoundingCoordinate><NorthBoundingCoordinate>53</NorthBoundingCoordinate><EastBoundingCoordinate>-60</EastBoundingCoordinate><SouthBoundingCoordinate>20</SouthBoundingCoordinate></BoundingRectangle></Geometry></HorizontalSpatialDomain></Spatial><Price>0</Price><OnlineResources><OnlineResource><URL>http://lightning.nsstc.nasa.gov/cgi-bin/nldn/nldn_cal.pl?1998+January</URL><Type>Browse</Type></OnlineResource><OnlineResource><URL>http://ghrc.nsstc.nasa.gov/uso/ds_docs/nldn/lightning_dataset.html</URL><Type>Guide</Type></OnlineResource><OnlineResource><URL>http://lightning.nsstc.nasa.gov/data/</URL><Type>Homepage</Type></OnlineResource></OnlineResources><Orderable>true</Orderable><DataFormat>HDF</DataFormat><Visible>true</Visible></Granule></result></results>", :headers => {"date"=>["Tue, 14 Mar 2017 19:36:02 GMT"], "content-type"=>["application/echo10+xml; charset=utf-8"], "access-control-expose-headers"=>["CMR-Hits, CMR-Request-Id"], "access-control-allow-origin"=>["*"], "cmr-hits"=>["1"], "cmr-took"=>["26"], "cmr-request-id"=>["46ad6de7-598a-463e-99e0-2a22ddf651da"], "vary"=>["Accept-Encoding, User-Agent"], "connection"=>["close"], "server"=>["Jetty(9.2.z-SNAPSHOT)"], "strict-transport-security"=>["max-age=31536000"]})

      #Making sure record does not exist before ingest
      assert_equal(0, (Collection.where concept_id: "C222702-GHRC").length)

      post :create, concept_id: "C222702-GHRC", revision_id: "32", granulesCount: 1

      #redirects after creation
      assert_equal("302", response.code)

      #collection with rawJSON saved in system
      assert_equal(1, (Collection.where concept_id: "C222702-GHRC").length)
      assert_equal("daylightn", (Collection.where concept_id: "C222702-GHRC").first.records.first.values["ShortName"])

      record = (Collection.where concept_id: "C222702-GHRC").first.records.first
      #script ran on new collection
      refute(record.binary_script_values["InsertTime"])

      #ingest for collection logged
      assert_equal("abaker@element84.com", record.ingest.user.email)

      #saves 1 associated granule
      assert_equal(1, (Collection.where concept_id: "C222702-GHRC").first.granules.length)
      #needs to match regex since the granule that is taken from the list is random each time
      assert_equal(0, (Collection.where concept_id: "C222702-GHRC").first.granules.first.records.first.values["GranuleUR"] =~ /Ndaily/)

      granule_record = (Collection.where concept_id: "C222702-GHRC").first.granules.first.records.first
      #ingest for granule logged
      assert_equal("abaker@element84.com", granule_record.ingest.user.email)
    end
  end
end
