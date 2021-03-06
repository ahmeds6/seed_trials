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

#01
def insert_study_protocol_query(seedTrialID)
  @seed_json_data = read_json_from_dir(@converted_json_dir, @dt4_formula_json)
  @seed_data = @seed_json_data.find {|x| x['seedTrialID'] == "#{seedTrialID}"}
  puts @seed_data
  sql_insert_study_protocol =
"INSERT INTO study_protocol
     (
     identifier,
     accr_rept_meth_code,
     acronym,
     accept_healthy_volunteers_indicator,
     data_monty_comty_apptn_indicator,
     delayed_posting_indicator,
     expd_access_indidicator,
     fda_regulated_indicator,
     review_brd_approval_req_indicator,
     keyword_text,
     official_title,
     max_target_accrual_num,
     phase_code,
     phase_other_text,
     pri_compl_date,
     pri_compl_date_type_code,
     start_date,
     start_date_type_code,
     primary_purpose_code,
     primary_purpose_other_text,
     public_description,
     public_tittle,
     section801_indicator,
     record_verification_date,
     scientific_description,
     study_protocol_type,
     allocation_code,
     blinding_role_code_subject,
     blinding_role_code_caregiver,
     blinding_role_code_investigator,
     blinding_role_code_outcome,
     blinding_schema_code,
     design_configuration_code,
     number_of_intervention_groups,
     study_classification_code,
     bio_specimen_description,
     bio_specimen_retention_code,
     sampling_method_code,
     number_of_groups,
     study_model_code,
     study_model_other_text,
     time_perspective_code,
     time_perspective_other_text,
     study_population_description,
     date_last_created,
     date_last_updated,
     status_code,
     status_date,
     amendment_number,
     amendment_date,
     amendment_reason_code,
     submission_number,
     parent_protocol_identifier,
     program_code_text,
     min_target_accrual_num,
     proprietary_trial_indicator,
     ctgov_xml_required_indicator,
     user_last_created_id,
     user_last_updated_id,
     phase_additional_qualifier_code,
     primary_purpose_additional_qualifier_code,
     completion_date,
     completion_date_type_code,
     study_subtype_code,
     comments,
     processing_priority,
     assigned_user_id,
     ctro_override,
     secondary_purpose_other_text,
     nci_grant,
     consortia_trial_category,
     final_accrual_num,
     study_source,
     accrual_disease_code_system,
     submitting_organization_id,
     ctro_override_flag_comments,
     expected_abstraction_completion_date,
     expected_abstraction_completion_comments,
     pcd_sent_to_pio_date,
     pcd_confirm_date,
     designee_notified_date,
     reporting_in_process_date,
     three_month_reminder_date,
     five_month_reminder_date,
     seven_month_escalation_to_pio_date,
     results_sent_to_pio_date,
     results_approved_by_pio_date,
     prs_release_date,
     qa_comments_return_date,
     trial_published_date,
     use_standard_language,
     date_entered_in_prs,
     designee_acess_revoked,
     designee_acess_revoked_date,
     changes_in_ctrp_ctgov,
     changes_in_ctrp_ctgov_date,
     send_to_ctgov_updated,
     nci_id,
     dcp_id,
     ccr_id,
     nct_id,
     ctep_id,
     lead_org_id,
     nih_nci_division_department_identifier,
     nih_nci_program_identifier
     )
    VALUES
     (
     '#{@seed_data['identifier'].gsub("'", "")}',
     '#{@seed_data['accr_rept_meth_code'].gsub("'", "")}',
     '#{@seed_data['acronym']}',
     '#{@seed_data['accept_healthy_volunteers_indicator'].gsub("'", "")}',
     '#{@seed_data['data_monty_comty_apptn_indicator'].gsub("'", "")}',
     '#{@seed_data['delayed_posting_indicator'].gsub("'", "")}',
     '#{@seed_data['expd_access_indidicator']}',
     '#{@seed_data['fda_regulated_indicator'].gsub("'", "")}',
     '#{@seed_data['review_brd_approval_req_indicator'].gsub("'", "")}',
     '#{@seed_data['keyword_text']}',
     '#{@seed_data['official_title'].gsub("'", "")}',
     '#{@seed_data['max_target_accrual_num']}',
     '#{@seed_data['phase_code'].gsub("'", "")}',
     '#{@seed_data['phase_other_text']}',
     '#{@seed_data['pri_compl_date'].gsub("'", "")}',
     '#{@seed_data['pri_compl_date_type_code'].gsub("'", "")}',
     '#{@seed_data['start_date'].gsub("'", "")}',
     '#{@seed_data['start_date_type_code'].gsub("'", "")}',
     '#{@seed_data['primary_purpose_code'].gsub("'", "")}',
     '#{@seed_data['primary_purpose_other_text'].gsub("'", "")}',
     '#{@seed_data['public_description'].gsub("'", "")}',
     '#{@seed_data['public_tittle'].gsub("'", "")}',
     '#{@seed_data['section801_indicator'].gsub("'", "")}',
     '#{@seed_data['record_verification_date']}',
     '#{@seed_data['scientific_description']}',
     '#{@seed_data['study_protocol_type'].gsub("'", "")}',
     '#{@seed_data['allocation_code'].gsub("'", "")}',
     '#{@seed_data['blinding_role_code_subject'].gsub("'", "")}',
     '#{@seed_data['blinding_role_code_caregiver']}',
     '#{@seed_data['blinding_role_code_investigator']}',
     '#{@seed_data['blinding_role_code_outcome']}',
     '#{@seed_data['blinding_schema_code']}',
     '#{@seed_data['design_configuration_code'].gsub("'", "")}',
     '#{@seed_data['number_of_intervention_groups'].gsub("'", "")}',
     '#{@seed_data['study_classification_code']}',
     '#{@seed_data['bio_specimen_description']}',
     '#{@seed_data['bio_specimen_retention_code']}',
     '#{@seed_data['sampling_method_code']}',
     '#{@seed_data['number_of_groups']}',
     '#{@seed_data['study_model_code']}',
     '#{@seed_data['study_model_other_text']}',
     '#{@seed_data['time_perspective_code']}',
     '#{@seed_data['time_perspective_other_text']}',
     '#{@seed_data['study_population_description']}',
     '#{@seed_data['date_last_created'].gsub("'", "")}',
     '#{@seed_data['date_last_updated'].gsub("'", "")}',
     '#{@seed_data['status_code'].gsub("'", "")}',
     '#{@seed_data['status_date'].gsub("'", "")}',
     '#{@seed_data['amendment_number']}',
     '#{@seed_data['amendment_date']}',
     '#{@seed_data['amendment_reason_code']}',
     '#{@seed_data['submission_number'].gsub("'", "")}',
     '#{@seed_data['parent_protocol_identifier']}',
     '#{@seed_data['program_code_text'].gsub("'", "")}',
     '#{@seed_data['min_target_accrual_num'].gsub("'", "")}',
     '#{@seed_data['proprietary_trial_indicator'].gsub("'", "")}',
     '#{@seed_data['ctgov_xml_required_indicator'].gsub("'", "")}',
     '#{@seed_data['user_last_created_id'].gsub("'", "")}',
     '#{@seed_data['user_last_updated_id']}',
     '#{@seed_data['phase_additional_qualifier_code'].gsub("'", "")}',
     '#{@seed_data['primary_purpose_additional_qualifier_code'].gsub("'", "")}',
     '#{@seed_data['completion_date'].gsub("'", "")}',
     '#{@seed_data['completion_date_type_code'].gsub("'", "")}',
     '#{@seed_data['study_subtype_code']}',
     '#{@seed_data['comments']}',
     '#{@seed_data['processing_priority'].gsub("'", "")}',
     '#{@seed_data['assigned_user_id']}',
     '#{@seed_data['ctro_override'].gsub("'", "")}',
     '#{@seed_data['secondary_purpose_other_text'].gsub("'", "")}',
     '#{@seed_data['nci_grant'].gsub("'", "")}',
     '#{@seed_data['consortia_trial_category']}',
     '#{@seed_data['final_accrual_num']}',
     '#{@seed_data['study_source'].gsub("'", "")}',
     '#{@seed_data['accrual_disease_code_system'].gsub("'", "")}',
     '#{@seed_data['submitting_organization_id'].gsub("'", "")}',
     '#{@seed_data['ctro_override_flag_comments']}',
     '#{@seed_data['expected_abstraction_completion_date']}',
     '#{@seed_data['expected_abstraction_completion_comments']}',
     '#{@seed_data['pcd_sent_to_pio_date']}',
     '#{@seed_data['pcd_confirm_date']}',
     '#{@seed_data['designee_notified_date']}',
     '#{@seed_data['reporting_in_process_date']}',
     '#{@seed_data['three_month_reminder_date']}',
     '#{@seed_data['five_month_reminder_date']}',
     '#{@seed_data['seven_month_escalation_to_pio_date']}',
     '#{@seed_data['results_sent_to_pio_date']}',
     '#{@seed_data['results_approved_by_pio_date']}',
     '#{@seed_data['prs_release_date']}',
     '#{@seed_data['qa_comments_return_date']}',
     '#{@seed_data['trial_published_date']}',
     '#{@seed_data['use_standard_language']}',
     '#{@seed_data['date_entered_in_prs']}',
     '#{@seed_data['designee_acess_revoked']}',
     '#{@seed_data['designee_acess_revoked_date']}',
     '#{@seed_data['changes_in_ctrp_ctgov']}',
     '#{@seed_data['changes_in_ctrp_ctgov_date']}',
     '#{@seed_data['send_to_ctgov_updated']}',
     '#{@seed_data['nci_id'].gsub("'", "")}',
     '#{@seed_data['dcp_id']}',
     '#{@seed_data['ccr_id']}',
     '#{@seed_data['nct_id'].gsub("'", "")}',
     '#{@seed_data['ctep_id']}',
     '#{@seed_data['lead_org_id'].gsub("'", "")}',
     '#{@seed_data['nih_nci_division_department_identifier']}',
     '#{@seed_data['nih_nci_program_identifier']}'
     );"
  puts sql_insert_study_protocol
end


insert_study_protocol_query 'ST20182602A'
