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

#17
def insert_arm(seedTrialID)
     @seed_json_data = read_json_from_dir(@converted_json_dir, @dt4_formula_json)
     @seed_data = @seed_json_data.find {|x| x['seedTrialID'] == "#{seedTrialID}"}
     puts @seed_data
sql_insert_arm =
    "
      INSERT INTO arm (identifier,study_protocol_identifier,name,type_code,description_text,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i-1320}','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','Arm1','EXPERIMENTAL','Arm description','2018-02-21 13:37:24.422969','2018-02-21 13:37:24.422969','14','14');
      INSERT INTO arm (identifier,study_protocol_identifier,name,type_code,description_text,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i-1319}','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','Arm1','EXPERIMENTAL','Arm description','2018-02-21 13:38:46.80249','2018-02-21 13:38:46.80249','14','14');
     "
     puts sql_insert_arm
end

# insert_arm 'ST20182602A'

