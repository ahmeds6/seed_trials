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

#19
def insert_planned_eligibility_criterion(seedTrialID)
     @seed_json_data = read_json_from_dir(@converted_json_dir, @dt4_formula_json)
     @seed_data = @seed_json_data.find {|x| x['seedTrialID'] == "#{seedTrialID}"}
     puts @seed_data
sql_insert_planned_eligibility_criterion =
    "
      INSERT INTO planned_eligibility_criterion (identifier,inclusion_indicator,criterion_name,operator,eligible_gender_code,min_value,min_unit,max_value,max_unit,unit,display_order,structured_indicator,text_value,cde_public_identifier,cde_version_number) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i-165}','t','AGE',NULL,NULL,'12.0','Years','80.0','Years',NULL,NULL,NULL,NULL,NULL,NULL);
      INSERT INTO planned_eligibility_criterion (identifier,inclusion_indicator,criterion_name,operator,eligible_gender_code,min_value,min_unit,max_value,max_unit,unit,display_order,structured_indicator,text_value,cde_public_identifier,cde_version_number) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i-164}','t','GENDER',NULL,'MALE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
      INSERT INTO planned_eligibility_criterion (identifier,inclusion_indicator,criterion_name,operator,eligible_gender_code,min_value,min_unit,max_value,max_unit,unit,display_order,structured_indicator,text_value,cde_public_identifier,cde_version_number) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i-163}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','f',NULL,NULL,NULL);
      INSERT INTO planned_eligibility_criterion (identifier,inclusion_indicator,criterion_name,operator,eligible_gender_code,min_value,min_unit,max_value,max_unit,unit,display_order,structured_indicator,text_value,cde_public_identifier,cde_version_number) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i-161}','t','AGE',NULL,NULL,'12.0','Years','80.0','Years',NULL,NULL,NULL,NULL,NULL,NULL);
     "
puts sql_insert_planned_eligibility_criterion
end

# insert_planned_eligibility_criterion 'ST20182602A'
