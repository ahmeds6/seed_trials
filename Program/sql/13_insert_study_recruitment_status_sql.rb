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

#13
def insert_study_recruitment_status(seedTrialID)
     @seed_json_data = read_json_from_dir(@converted_json_dir, @dt4_formula_json)
     @seed_data = @seed_json_data.find {|x| x['seedTrialID'] == "#{seedTrialID}"}
     puts @seed_data
sql_insert_study_recruitment_status =
     "
      INSERT INTO study_recruitment_status (identifier,status_code,status_date,study_protocol_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+9}','#{@seed_data['study_recruitment_status_status_code'].gsub("'", "")}','#{@seed_data['study_recruitment_status_status_date'].gsub("'", "")}','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}',NULL,NULL,NULL,NULL);
     "
     puts sql_insert_study_recruitment_status
end

# insert_study_recruitment_status 'ST20182602A'
