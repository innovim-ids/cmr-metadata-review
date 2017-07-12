#RecordFormats are modules to be included in record objects upon initialization
#
#Since individual record formats have different underlying structures of RecordData objects
#unique accessors are needed for each format to access commonly requested data.
module RecordFormats::Dif10Record
  SECTION_TITLES = ["Platform", "Science_Keywords", "Dataset_Citation", "Organization", "Personnel", "Related_URL", "Additional_Attributes", "Temporal_Coverage", "Spatial_Coverage", "Project", "Metadata_Dates"]

  def get_section_titles
    SECTION_TITLES
  end


  # ====Params   
  # None
  # ====Returns
  # String
  # ==== Method
  # Accesses the record's RecordData attribute and then returns the value of the "LongName" (equivalent) field
  def long_name 
    self.get_column("Entry_Title")
  end 

  # ====Params   
  # None
  # ====Returns
  # String
  # ==== Method
  # Accesses the record's RecordData attribute and then returns the value of the "ShortName" (equivalent) field
  def short_name
    self.get_column("Entry_ID/Short_Name")
  end

  # ====Params   
  # None
  # ====Returns
  # String
  # ==== Method
  # Accesses the record's RecordData attribute and then returns the value of the "VersionId" (equivalent) field
  def version_id
    self.get_column("Entry_ID/Version")
  end

  #There is currently no script for DIF10 records
  def create_script(raw_data = nil)
    nil 
  end

  #There is currently no script for DIF10 records
  def evaluate_script(raw_data = nil)
    nil
  end

  def controlled_notice_list(element_list)
    controlled_map = {}
    element_list.map do |element|
      if CONTROLLED_ELEMENT_MAP.key? element
        controlled_map[element] = CONTROLLED_ELEMENT_MAP[element]
      end
    end
    controlled_map
  end


  CONTROLLED_ELEMENT_MAP = {
    'Dataset_Citation/Persistent_Identifier/Type'=>' UMMCommon_1.2 XML Schema Definition; PersistentIdentifierEnum PersistentIdentifierEnum = DOI, ARK',
    'Personnel/Role' => 'UMMCommon_1.2 XML Schema Definition; PersonnelRoleEnum  "PersonnelRoleEnum = 

    enumeration value=""INVESTIGATOR""
    enumeration value=""INVESTIGATOR, TECHNICAL CONTACT""
    enumeration value=""METADATA AUTHOR""
    enumeration value=""METADATA AUTHOR, TECHNICAL CONTACT""
    enumeration value=""TECHNICAL CONTACT"""',

    'Personnel/Contact_Person/Phone/Type'=>'   UMMCommon_1.2 XML Schema Definition; PhoneTypeEnum  PhoneTypeEnum = Direct Line, Primary, Telephone, Fax, Mobile, Modem, TDD/TTY Phone, U.S. toll free, Other',
    'Personnel/Contact_Group/Phone/Type'=>'  UMMCommon_1.2 XML Schema Definition; PhoneTypeEnum  PhoneTypeEnum = Direct Line, Primary, Telephone, Fax, Mobile, Modem, TDD/TTY Phone, U.S. toll free, Other',
    'Science_Keywords/Category'=>' GCMD keywords https://gcmdservices.gsfc.nasa.gov/static/kms/sciencekeywords/sciencekeywords.csv',
    'Science_Keywords/Topic'=>'  GCMD keywords https://gcmdservices.gsfc.nasa.gov/static/kms/sciencekeywords/sciencekeywords.csv',
    'Science_Keywords/Term'=>' GCMD keywords https://gcmdservices.gsfc.nasa.gov/static/kms/sciencekeywords/sciencekeywords.csv',
    'Science_Keywords/Variable_Level_1'=>' GCMD keywords https://gcmdservices.gsfc.nasa.gov/static/kms/sciencekeywords/sciencekeywords.csv',
    'Science_Keywords/Variable_Level_2'=>' GCMD keywords https://gcmdservices.gsfc.nasa.gov/static/kms/sciencekeywords/sciencekeywords.csv',
    'Science_Keywords/Variable_Level_3'=>' GCMD keywords https://gcmdservices.gsfc.nasa.gov/static/kms/sciencekeywords/sciencekeywords.csv',
    'Platform/Type'=>' ARC refers to the GCMD keywords, but a PlatformTypeEnum is also available in the UMMCommon_1.2 XML Schema Definition  PlatformTypeEnum = Not provided, Not applicable, Aircraft, Balloons/Rockets, Earth Observation Satellites, In Situ Land-based Platforms, In Situ Ocean-based Platforms, Interplanetary Spacecraft, Maps/Charts/Photographs, Models/Analyses, Navigation Platforms, Solar/Space Observation Satellites, Space Stations/Manned Spacecraft',
    'Platform/Short_Name'=>' GCMD keywords https://gcmdservices.gsfc.nasa.gov/static/kms/platforms/platforms.csv',
    'Platform/Long_Name'=>'  GCMD keywords https://gcmdservices.gsfc.nasa.gov/static/kms/platforms/platforms.csv',
    'Platform/Instrument/Short_Name'=>'  GCMD keywords https://gcmdservices.gsfc.nasa.gov/static/kms/instruments/instruments.csv',
    'Platform/Instrument/Long_Name'=>' GCMD keywords https://gcmdservices.gsfc.nasa.gov/static/kms/instruments/instruments.csv',
    'Platform/Instrument/Sensor/Short_Name'=>' GCMD keywords https://gcmdservices.gsfc.nasa.gov/static/kms/instruments/instruments.csv',
    'Platform/Instrument/Sensor/Long_Name'=>'  GCMD keywords https://gcmdservices.gsfc.nasa.gov/static/kms/instruments/instruments.csv',
    'Temporal_Coverage/Range_DateTime/Beginning_Date_Time'=>'  If a date or dateTime is not used, this element must match a string from the DateEnum found in the UMMCommon_1.2 XML Schema Definition. DateEnum = Not provided, unknown, present, unbounded, future',
    'Temporal_Coverage/Range_DateTime/Ending_Date_Time'=>'   If a date or dateTime is not used, this element must match a string from the DateEnum found in the UMMCommon_1.2 XML Schema Definition. DateEnum = Not provided, unknown, present, unbounded, future',
    'Temporal_Coverage/Single_Date_Time'=>'  If a date or dateTime is not used, this element must match a string from the DateEnum found in the UMMCommon_1.2 XML Schema Definition. DateEnum = Not provided, unknown, present, unbounded, future',
    'Temporal_Coverage/Periodic_DateTime/Start_Date'=>'  If a date or dateTime is not used, this element must match a string from the DateEnum found in the UMMCommon_1.2 XML Schema Definition. DateEnum = Not provided, unknown, present, unbounded, future',
    'Temporal_Coverage/Periodic_DateTime/End_Date'=>'  If a date or dateTime is not used, this element must match a string from the DateEnum found in the UMMCommon_1.2 XML Schema Definition. DateEnum = Not provided, unknown, present, unbounded, future',
    'Temporal_Coverage/Periodic_DateTime/Duration_Unit'=>' UMMCommon_1.2 XML Schema Definition; DurationUnitEnum DurationUnitEnum = DAY, MONTH, YEAR',
    'Temporal_Coverage/Periodic_DateTime/Period_Cycle_Duration_Unit'=>'  UMMCommon_1.2 XML Schema Definition; DurationUnitEnum DurationUnitEnum = DAY, MONTH, YEAR',
    'Dataset_Progress'=>'  UMMCommon_1.2 XML Schema Definition; DatasetProgressEnum  DatasetProgressEnum = PLANNED, IN WORK, COMPLETE',
    'Spatial_Coverage/Spatial_Coverage_Type'=> '(Note that this is not the same as Spatial_Coverage/Spatial_Info/Spatial_Coverage_Type)"  UMMCommon_1.2 XML Schema Definition; SpatialCoverageTypeEnum  SpatialCoverageTypeEnum = Horizontal, HorizontalVertical, Orbit, Vertical, Horizon&amp;Vert',
    'Spatial_Coverage/Granule_Spatial_Representation'=>' UMMCommon_1.2 XML Schema Definition; GranuleSpatialRepresentationEnum GranuleSpatialRepresentationEnum = CARTESIAN, GEODETIC, ORBIT, NO_SPATIAL',
    'Spatial_Coverage/Geometry/Coordinate_System'=>'   UMMCommon_1.2 XML Schema Definition; CoordinateSystemEnum CoordinateSystemEnum = CARTESIAN, GEODETIC',
    'Location/Location_Category'=>'  GCMD keywords https://gcmdservices.gsfc.nasa.gov/static/kms/locations/locations.csv',
    'Location/Location_Type'=>'  GCMD keywords https://gcmdservices.gsfc.nasa.gov/static/kms/locations/locations.csv',
    'Location/Location_Subregion1'=>'  GCMD keywords https://gcmdservices.gsfc.nasa.gov/static/kms/locations/locations.csv',
    'Location/Location_Subregion2'=>'  GCMD keywords https://gcmdservices.gsfc.nasa.gov/static/kms/locations/locations.csv',
    'Location/Location_Subregion3'=>'  GCMD keywords https://gcmdservices.gsfc.nasa.gov/static/kms/locations/locations.csv',
    'Data_Resolution/Horizontal_Resolution_Range'=>' GCMD keywords https://gcmdservices.gsfc.nasa.gov/static/kms/horizontalresolutionrange/horizontalresolutionrange.csv',
    'Data_Resolution/Vertical_Resolution_Range'=>' GCMD keywords https://gcmdservices.gsfc.nasa.gov/static/kms/verticalresolutionrange/verticalresolutionrange.csv',
    'Data_Resolution/Temporal_Resolution_Range'=>' GCMD keywords https://gcmdservices.gsfc.nasa.gov/static/kms/temporalresolutionrange/temporalresolutionrange.csv',
    'Project/Short_Name'=>'  GCMD keywords https://gcmdservices.gsfc.nasa.gov/static/kms/projects/projects.csv',
    'Project/Long_Name'=>' GCMD keywords https://gcmdservices.gsfc.nasa.gov/static/kms/projects/projects.csv',
    'Dataset_Language'=>'  UMMCommon_1.2 XML Schema Definition; DatasetLanguageEnum  DatasetLanguageEnum = English, Afrikaans, Arabic, Bosnian, Bulgarian, Chinese, Croatian, Czech, Danish, Dutch, Estonian, Finnish, French, German, Hebrew, Hungarian, Indonesian, Italian, Japanese, Korean, Latvian, Lithuanian, Norwegian, Polish, Portuguese, Romanian, Russian, Slovak, Spanish, Ukrainian, Vietnamese',
    'Organization/Organization_Type'=>'  UMMCommon_1.2 XML Schema Definition; OrganizationTypeEnum OrganizationTypeEnum = DISTRIBUTOR, ARCHIVER, ORIGINATOR, PROCESSOR',
    'Organization/Organization_Name/Short_Name'=>' GCMD keywords https://gcmdservices.gsfc.nasa.gov/static/kms/providers/providers.csv',
    'Organization/Organization_Name/Long_Name'=>'  GCMD keywords https://gcmdservices.gsfc.nasa.gov/static/kms/providers/providers.csv',
    'Organization/Personnel/Role'=>' UMMCommon_1.2 XML Schema Definition; OrganizationPersonnelRoleEnum  OrganizationPersonnelRoleEnum = DATA CENTER CONTACT',
    'Organization/Personnel/Contact_Person/Phone/Type'=>'  UMMCommon_1.2 XML Schema Definition; PhoneTypeEnum  PhoneTypeEnum = Direct Line, Primary, Telephone, Fax, Mobile, Modem, TDD/TTY Phone, U.S. toll free, Other',
    'Organization/Personnel/Contact_Group/Phone/Type'=>' UMMCommon_1.2 XML Schema Definition; PhoneTypeEnum  PhoneTypeEnum = Direct Line, Primary, Telephone, Fax, Mobile, Modem, TDD/TTY Phone, U.S. toll free, Other',
    'Reference/Persistent_Identifier/Type'=>'  UMMCommon_1.2 XML Schema Definition; PersistentIdentifierEnum PersistentIdentifierEnum = DOI, ARK',
    'Related_URL/URL_Content_Type/Type'=>' GCMD keywords Unsure if ARC should be recommending GCMD URL Content Types or the Umm-Common RelatedURLTypeEnum (the differ slightly)',
    'Related_URL/URL_Content_Type/Subtype'=>'  GCMD keywords Unsure if ARC should be recommending GCMD URL Content Types or the Umm-Common RelatedURLTypeEnum (the differ slightly)',
    'Related_URL/Protocol'=> '(Element will be depreciated in DIF 10.3)  Not sure if this element even maps to UMM. If it does, it likely maps to RelatedURLs/GetService/Protocol, which is controlled in UMM-Common.  GetServiceType Protocol enum in the UMM-Common JSON schema = HTTP, HTTPS, FTP, FTPS, Not provided',
    'Related_URL/Mime_Type'=>' Not sure if this element even maps to UMM. If it does, it likely maps to RelatedURLs/Get Service/MimeType, which is controlled in UMM-Common by the URLMimeTypeEnum.  URLMimeTypeEnum = application/json, application/xml, application/x-netcdf, application/gml+xml, application/vnd.google-earch.kml+xml, image/gif, image/tiff, image/bmp, text/csv, text/xml, application/pdf, application/x-hdf, application/xhdf5, application/octet-stream, application/vnd.google-earth.kmz, image/jpeg, image/png, image/vnd.collada+xml, text/html, text/plain, Not provided',
    'Metadata_Association/Type'=>' UMMCommon_1.2 XML Schema Definition; MetadataAssociationTypeEnum  Definitely controlled; not exactly sure on the enumeration vaues, but we rarely see this',
    'Product_Level_Id'=>'  UMMCommon_1.2 XML Schema Definition; ProductLevelIdEnum ProductLevelIdEnum = Not provided, 0, 1, 1A, 1B, 1T, 2, 2G, 2P, 3, 4, NA',
    'Product_Flag'=>'  UMMCommon_1.2 XML Schema Definition; ProductFlagEnum  ProductFlagEnum = Not provided, DATA_PRODUCT_FILE, INSTRUMENT_ANCILLARY_FILE, SYSTEM/SPACECRAFT_FILE, EXTERNAL_DATA',
    'Collection_Data_Type'=>'  UMMCommon_1.2 XML Schema Definition; CollectionDataTypeEnum CollectionDataTypeEnum = SCIENCE_QUALITY, NEAR_REAL_TIME, ON_DEMAND, OTHER',
    'Metadata_Version'=>'  UMMCommon_1.2 XML Schema Definition; MetadataVersionEnum  MetadataVersionEnum = VERSION 9.8.1, VERSION 9.8.2, VERSION 9.8.2.2, VERSION 9.8.3, VERSION 9.8.4, VERSION 9.9.3, VERSION 10.2',
    'Metadata_Dates/Metadata_Creation'=>'  If a date or dateTime is not used, this element must match a string from the DateEnum found in the UMMCommon_1.2 XML Schema Definition. DateEnum = Not provided, unknown, present, unbounded, future',
    'Metadata_Dates/Metadata_Last_Revision'=>' If a date or dateTime is not used, this element must match a string from the DateEnum found in the UMMCommon_1.2 XML Schema Definition. DateEnum = Not provided, unknown, present, unbounded, future',
    'Metadata_Dates/Metadata_Future_Review'=>' If a date or dateTime is not used, this element must match a string from the DateEnum found in the UMMCommon_1.2 XML Schema Definition. DateEnum = Not provided, unknown, present, unbounded, future',
    'Metadata_Dates/Metadata_Delete'=>'  If a date or dateTime is not used, this element must match a string from the DateEnum found in the UMMCommon_1.2 XML Schema Definition. DateEnum = Not provided, unknown, present, unbounded, future',
    'Metadata_Dates/Data_Creation'=>'  If a date or dateTime is not used, this element must match a string from the DateEnum found in the UMMCommon_1.2 XML Schema Definition. DateEnum = Not provided, unknown, present, unbounded, future',
    'Metadata_Dates/Data_Last_Revision'=>' If a date or dateTime is not used, this element must match a string from the DateEnum found in the UMMCommon_1.2 XML Schema Definition. DateEnum = Not provided, unknown, present, unbounded, future',
    'Metadata_Dates/Data_Future_Review'=>' If a date or dateTime is not used, this element must match a string from the DateEnum found in the UMMCommon_1.2 XML Schema Definition. DateEnum = Not provided, unknown, present, unbounded, future',
    'Metadata_Dates/Data_Delete'=>'  If a date or dateTime is not used, this element must match a string from the DateEnum found in the UMMCommon_1.2 XML Schema Definition. DateEnum = Not provided, unknown, present, unbounded, future',
    'Private'=>' UMMCommon_1.2 XML Schema Definition; PrivateEnum  PrivateEnum = True, False'
  }
end
