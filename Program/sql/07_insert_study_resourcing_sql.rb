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

#07
def insert_study_resourcing(seedTrialID)
     @seed_json_data = read_json_from_dir(@converted_json_dir, @dt4_formula_json)
     @seed_data = @seed_json_data.find {|x| x['seedTrialID'] == "#{seedTrialID}"}
     puts @seed_data
sql_insert_study_resourcing =
    "
      INSERT INTO study_resourcing (identifier,type_code,summ_4_rept_indicator,organization_identifier,study_protocol_identifier,funding_mechanism_code,nih_institute_code,nci_division_program_code,serial_number,active_indicator,inactive_comment_text,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,funding_percent) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+35}',NULL,'f',NULL,'#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','B09','AA','CCR','111111','t',NULL,'2018-02-21 08:34:57.128','2018-02-21 08:34:57.128','14','14','100');
      INSERT INTO study_resourcing (identifier,type_code,summ_4_rept_indicator,organization_identifier,study_protocol_identifier,funding_mechanism_code,nih_institute_code,nci_division_program_code,serial_number,active_indicator,inactive_comment_text,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,funding_percent) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+36}','EXTERNALLY_PEER_REVIEWED','t','129718','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}',NULL,NULL,NULL,NULL,'t',NULL,'2018-02-21 08:34:57.277','2018-02-21 08:34:57.277','14','14',NULL);
     "
     puts sql_insert_study_resourcing
end

# insert_study_resourcing 'ST20182602A'
