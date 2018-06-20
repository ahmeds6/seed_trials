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

#04
def insert_study_site(seedTrialID)
     @seed_json_data = read_json_from_dir(@converted_json_dir, @dt4_formula_json)
     @seed_data = @seed_json_data.find {|x| x['seedTrialID'] == "#{seedTrialID}"}
     puts @seed_data
sql_insert_study_site =
    "
    ﻿INSERT INTO study_site (identifier,functional_code,local_sp_indentifier,review_board_approval_number,review_board_approval_date,review_board_approval_status_code,target_accrual_number,study_protocol_identifier,healthcare_facility_identifier,research_organization_identifier,oversight_committee_identifier,status_code,status_date_range_low,date_last_created,date_last_updated,status_date_range_high,review_board_organizational_affiliation,program_code_text,accrual_date_range_low,accrual_date_range_high,user_last_created_id,user_last_updated_id) VALUES (#{@seed_data['stdy_s1_identifier']},'LEAD_ORGANIZATION',#{@seed_data['stdy_s1_local_sp_indentifier']},NULL,NULL,NULL,NULL,#{@seed_data['stdy_s1_study_protocol_identifier']},NULL,'129796',NULL,'PENDING','2018-02-21 08:34:57.602','2018-02-21 08:34:57.602','2018-02-21 08:34:57.602',NULL,NULL,NULL,NULL,NULL,'14','14');
     INSERT INTO study_site (identifier,functional_code,local_sp_indentifier,review_board_approval_number,review_board_approval_date,review_board_approval_status_code,target_accrual_number,study_protocol_identifier,healthcare_facility_identifier,research_organization_identifier,oversight_committee_identifier,status_code,status_date_range_low,date_last_created,date_last_updated,status_date_range_high,review_board_organizational_affiliation,program_code_text,accrual_date_range_low,accrual_date_range_high,user_last_created_id,user_last_updated_id) VALUES (#{@seed_data['stdy_s2_identifier']},'SPONSOR',NULL,NULL,NULL,NULL,NULL,#{@seed_data['stdy_s2_study_protocol_identifier']},NULL,'129796',NULL,'PENDING','2018-02-21 08:34:58.064','2018-02-21 08:34:58.064','2018-02-21 08:34:58.064',NULL,NULL,NULL,NULL,NULL,'14','14');
     INSERT INTO study_site (identifier,functional_code,local_sp_indentifier,review_board_approval_number,review_board_approval_date,review_board_approval_status_code,target_accrual_number,study_protocol_identifier,healthcare_facility_identifier,research_organization_identifier,oversight_committee_identifier,status_code,status_date_range_low,date_last_created,date_last_updated,status_date_range_high,review_board_organizational_affiliation,program_code_text,accrual_date_range_low,accrual_date_range_high,user_last_created_id,user_last_updated_id) VALUES (#{@seed_data['stdy_s3_identifier']},'IDENTIFIER_ASSIGNER',#{@seed_data['stdy_s3_local_sp_indentifier']},NULL,NULL,NULL,NULL,'1618195',NULL,'1',NULL,'PENDING','2018-02-21 08:34:58.297','2018-02-21 08:34:58.297','2018-02-21 08:34:58.297',NULL,NULL,NULL,NULL,NULL,'14','14');
     INSERT INTO study_site (identifier,functional_code,local_sp_indentifier,review_board_approval_number,review_board_approval_date,review_board_approval_status_code,target_accrual_number,study_protocol_identifier,healthcare_facility_identifier,research_organization_identifier,oversight_committee_identifier,status_code,status_date_range_low,date_last_created,date_last_updated,status_date_range_high,review_board_organizational_affiliation,program_code_text,accrual_date_range_low,accrual_date_range_high,user_last_created_id,user_last_updated_id) VALUES (#{@seed_data['stdy_s4_identifier']},'FUNDING_SOURCE',NULL,NULL,NULL,NULL,NULL,#{@seed_data['stdy_s4_study_protocol_identifier']},NULL,'4',NULL,'PENDING','2018-02-21 08:34:58.53','2018-02-21 08:34:58.53','2018-02-21 08:34:58.53',NULL,NULL,NULL,NULL,NULL,'14','14');
    "
     puts sql_insert_study_site
end

#insert_study_site 'ST20182602A'
