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


#08
def insert_study_otheridentifiers(seedTrialID)
     @seed_json_data = read_json_from_dir(@converted_json_dir, @dt4_formula_json)
     @seed_data = @seed_json_data.find {|x| x['seedTrialID'] == "#{seedTrialID}"}
     puts @seed_data
sql_insert_study_otheridentifiers =
    "
      INSERT INTO study_otheridentifiers (study_protocol_id,null_flavor,displayable,extension,identifier_name,reliability,root,scope) VALUES ('#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}',NULL,NULL,'#{@seed_data['study_otheridentifiers_extension1'].gsub("'", "")}','Study Protocol Other Identifier',NULL,'2.16.840.1.113883.19',NULL);
      INSERT INTO study_otheridentifiers (study_protocol_id,null_flavor,displayable,extension,identifier_name,reliability,root,scope) VALUES ('#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}',NULL,NULL,'#{@seed_data['study_otheridentifiers_extension2'].gsub("'", "")}','NCI study protocol entity identifier',NULL,'2.16.840.1.113883.3.26.4.3',NULL);
     "
     puts sql_insert_study_otheridentifiers
end

# insert_study_otheridentifiers 'ST20182602A'
