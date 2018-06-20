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

#21
def insert_arm_intervention(seedTrialID)
     @seed_json_data = read_json_from_dir(@converted_json_dir, @dt4_formula_json)
     @seed_data = @seed_json_data.find {|x| x['seedTrialID'] == "#{seedTrialID}"}
     puts @seed_data
sql_insert_arm_intervention =
    "
      INSERT INTO arm_intervention (identifier,arm_identifier,planned_activity_identifier) VALUES ('117','#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i-1320}','#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i-162}');
    "
     puts sql_insert_arm_intervention
end

# insert_arm_intervention 'ST20182602A'