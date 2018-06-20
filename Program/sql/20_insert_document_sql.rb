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

#20
def insert_document(seedTrialID)
     @seed_json_data = read_json_from_dir(@converted_json_dir, @dt4_formula_json)
     @seed_data = @seed_json_data.find {|x| x['seedTrialID'] == "#{seedTrialID}"}
     puts @seed_data
sql_insert_document =
    "
      INSERT INTO document (identifier,type_code,active_indicator,file_name,study_protocol_identifier,inactive_comment_text,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,original,deleted,study_inbox_id,ctro_user_date_created,ccct_user_date_created,ctro_user_id,ccct_user_name) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+126}','PROTOCOL_DOCUMENT','t','protocol.pdf','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}',NULL,'2018-02-21 08:34:58.702','2018-02-21 08:34:58.877','14','14','t','f',NULL,NULL,NULL,NULL,NULL);
      INSERT INTO document (identifier,type_code,active_indicator,file_name,study_protocol_identifier,inactive_comment_text,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,original,deleted,study_inbox_id,ctro_user_date_created,ccct_user_date_created,ctro_user_id,ccct_user_name) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+127}','IRB_APPROVAL_DOCUMENT','t','irb.pdf','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}',NULL,'2018-02-21 08:34:58.756','2018-02-21 08:34:58.908','14','14','t','f',NULL,NULL,NULL,NULL,NULL);
      INSERT INTO document (identifier,type_code,active_indicator,file_name,study_protocol_identifier,inactive_comment_text,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,original,deleted,study_inbox_id,ctro_user_date_created,ccct_user_date_created,ctro_user_id,ccct_user_name) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+128}','PARTICIPATING_SITES','t','sites.pdf','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}',NULL,'2018-02-21 08:34:58.788','2018-02-21 08:34:58.941','14','14','t','f',NULL,NULL,NULL,NULL,NULL);
      INSERT INTO document (identifier,type_code,active_indicator,file_name,study_protocol_identifier,inactive_comment_text,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,original,deleted,study_inbox_id,ctro_user_date_created,ccct_user_date_created,ctro_user_id,ccct_user_name) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+129}','INFORMED_CONSENT_DOCUMENT','t','consent.pdf','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}',NULL,'2018-02-21 08:34:58.823','2018-02-21 08:34:58.972','14','14','t','f',NULL,NULL,NULL,NULL,NULL);
      INSERT INTO document (identifier,type_code,active_indicator,file_name,study_protocol_identifier,inactive_comment_text,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,original,deleted,study_inbox_id,ctro_user_date_created,ccct_user_date_created,ctro_user_id,ccct_user_name) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+130}','OTHER','t','other.pdf','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}',NULL,'2018-02-21 08:34:58.851','2018-02-21 08:34:59.001','14','14','t','f',NULL,NULL,NULL,NULL,NULL);
     "
     puts sql_insert_document
end

# insert_document 'ST20182602A'
