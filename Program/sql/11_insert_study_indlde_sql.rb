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

#11
def insert_study_indlde(seedTrialID)
     @seed_json_data = read_json_from_dir(@converted_json_dir, @dt4_formula_json)
     @seed_data = @seed_json_data.find {|x| x['seedTrialID'] == "#{seedTrialID}"}
     puts @seed_data
sql_insert_study_indlde =
    "
      INSERT INTO study_indlde (identifier,expanded_access_status_code,expanded_access_indicator,grantor_code,nih_inst_holder_code,nci_div_prog_holder_code,holder_type_code,indlde_number,indlde_type_code,study_protocol_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,exempt_indicator) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+21}','AVAILABLE','t','CDER','NEI',NULL,'NIH','111111','IND','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','2018-02-21 08:34:57.051','2018-02-21 08:34:57.051','14','14','t');
      INSERT INTO study_indlde (identifier,expanded_access_status_code,expanded_access_indicator,grantor_code,nih_inst_holder_code,nci_div_prog_holder_code,holder_type_code,indlde_number,indlde_type_code,study_protocol_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,exempt_indicator) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+34}','AVAILABLE','t','CDRH',NULL,'CCR','NCI','222222','IDE','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','2018-02-21 08:34:57.09','2018-02-21 08:34:57.09','14','14','t');
     "
     puts sql_insert_study_indlde
end

# insert_study_indlde 'ST20182602A'
