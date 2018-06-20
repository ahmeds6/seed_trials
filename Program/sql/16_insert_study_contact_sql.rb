require '../tools/readJSON'
require '../tools/csv2json'
require '../tools/excel2csv'
require 'csv'
require 'json'
require 'time'
require "json-diff"
require "hashdiff"
require 'yomu'

curren_dir = File.dirname(__FILE__)

puts "current directory: #{curren_dir}"

@converted_json_dir = "#{curren_dir}/../converted_json/"

@dt4_formula_json = "dt4_seed_data_formula.json"

#16
def insert_study_contact(seedTrialID)
     @seed_json_data = read_json_from_dir(@converted_json_dir, @dt4_formula_json)
     @seed_data = @seed_json_data.find {|x| x['seedTrialID'] == "#{seedTrialID}"}
     puts @seed_data
sql_insert_study_contact =
    "
      INSERT INTO study_contact (identifier,role_code,primary_indicator,address_line,delivery_address_line,city,state,postal_code,country_identifier,telephone,email,healthcare_provider_identifier,clinical_research_staff_identifier,study_protocol_identifier,status_code,status_date_range_low,date_last_created,date_last_updated,status_date_range_high,organizational_contact_identifier,user_last_created_id,user_last_updated_id,title,prs_user_name,comments) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+78}','STUDY_PRINCIPAL_INVESTIGATOR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'129817','129811','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','PENDING','2018-02-21 08:34:57.943','2018-02-21 08:34:57.942','2018-02-21 08:34:57.942',NULL,NULL,'14','14',NULL,NULL,NULL);
      INSERT INTO study_contact (identifier,role_code,primary_indicator,address_line,delivery_address_line,city,state,postal_code,country_identifier,telephone,email,healthcare_provider_identifier,clinical_research_staff_identifier,study_protocol_identifier,status_code,status_date_range_low,date_last_created,date_last_updated,status_date_range_high,organizational_contact_identifier,user_last_created_id,user_last_updated_id,title,prs_user_name,comments) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+97}','RESPONSIBLE_PARTY_SPONSOR_INVESTIGATOR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'129811','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','PENDING','2018-02-21 08:34:58.211','2018-02-21 08:34:58.211','2018-02-21 08:34:58.211',NULL,NULL,'14','14','CEO & Chairman',NULL,NULL);
     "
     puts sql_insert_study_contact
end

# insert_study_contact 'ST20182602A'
