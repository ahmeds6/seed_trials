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

#12
def insert_study_owner(seedTrialID)
     @seed_json_data = read_json_from_dir(@converted_json_dir, @dt4_formula_json)
     @seed_data = @seed_json_data.find {|x| x['seedTrialID'] == "#{seedTrialID}"}
     puts @seed_data
sql_insert_study_owner =
    "
      INSERT INTO study_owner (study_id,user_id,enable_emails) VALUES ('#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','#{@seed_data['study_owner_user_id'].gsub("'", "")}','t');
     "
     puts sql_insert_study_owner
end

# insert_study_owner 'ST20182602A'
