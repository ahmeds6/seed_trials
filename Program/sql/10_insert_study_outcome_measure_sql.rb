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

#10
def insert_study_outcome_measure(seedTrialID)
     @seed_json_data = read_json_from_dir(@converted_json_dir, @dt4_formula_json)
     @seed_data = @seed_json_data.find {|x| x['seedTrialID'] == "#{seedTrialID}"}
     puts @seed_data
sql_insert_study_outcome_measure =
    "
      INSERT INTO study_outcome_measure (identifier,name,timeframe,study_protocol_identifier,primary_indicator,safety_indicator,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,description,display_order,type_code) VALUES ('1617076','measure 1','measure timeframe 1','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}',NULL,NULL,'2018-02-21 13:37:24.422969','2018-02-21 13:37:24.422969','14','14',NULL,NULL,'PRIMARY');
      INSERT INTO study_outcome_measure (identifier,name,timeframe,study_protocol_identifier,primary_indicator,safety_indicator,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,description,display_order,type_code) VALUES ('1617077','measure 1','measure timeframe 1','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}',NULL,NULL,'2018-02-21 13:38:01.419347','2018-02-21 13:38:01.419347','14','14',NULL,NULL,'PRIMARY');
     "
     puts sql_insert_study_outcome_measure
end

# insert_study_outcome_measure 'ST20182602A'
