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

#09
def insert_study_disease(seedTrialID)
     @seed_json_data = read_json_from_dir(@converted_json_dir, @dt4_formula_json)
     @seed_data = @seed_json_data.find {|x| x['seedTrialID'] == "#{seedTrialID}"}
     puts @seed_data
sql_insert_study_disease =
    "
      INSERT INTO study_disease (identifier,study_protocol_identifier,disease_identifier,lead_disease_indicator,date_last_created,date_last_updated,ctgovxml_indicator,user_last_created_id,user_last_updated_id) VALUES ('#{@seed_data['study_disease_identifier1'].gsub("'", "")}','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','#{@seed_data['study_disease_disease_identifier'].gsub("'", "")}',NULL,'2018-02-21 13:37:24.422969','2018-02-21 13:37:24.422969','t','14','14');
      INSERT INTO study_disease (identifier,study_protocol_identifier,disease_identifier,lead_disease_indicator,date_last_created,date_last_updated,ctgovxml_indicator,user_last_created_id,user_last_updated_id) VALUES ('#{@seed_data['study_disease_identifier2'].gsub("'", "")}','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','#{@seed_data['study_disease_disease_identifier'].gsub("'", "")}',NULL,'2018-02-21 13:38:42.535208','2018-02-21 13:38:42.535208','t','14','14');
     "
     puts sql_insert_study_disease
end

# insert_study_disease 'ST20182602A'
