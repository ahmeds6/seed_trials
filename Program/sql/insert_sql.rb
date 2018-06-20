# require '../tools/readJSON'
# require '../tools/csv2json'
# require '../tools/excel2csv'
# require 'csv'
# require 'json'
# require 'time'
# require "json-diff"
# require "hashdiff"
# require 'yomu'
#
# curren_dir = File.dirname(__FILE__)
#
# puts "current directory: #{curren_dir}"
#
# @converted_json_dir = "#{curren_dir}/../converted_json/"
#
# @dt4_formula_json = "dt4_seed_data_formula.json"
#
# #01
# def insert_study_protocol_query(seedTrialID)
#   @seed_json_data = read_json_from_dir(@converted_json_dir, @dt4_formula_json)
#   @seed_data = @seed_json_data.find {|x| x['seedTrialID'] == "#{seedTrialID}"}
#   puts @seed_data
#   sql_insert_study_protocol =
# "INSERT INTO study_protocol
#      (
#      identifier,
#      accr_rept_meth_code,
#      acronym,
#      accept_healthy_volunteers_indicator,
#      data_monty_comty_apptn_indicator,
#      delayed_posting_indicator,
#      expd_access_indidicator,
#      fda_regulated_indicator,
#      review_brd_approval_req_indicator,
#      keyword_text,
#      official_title,
#      max_target_accrual_num,
#      phase_code,
#      phase_other_text,
#      pri_compl_date,
#      pri_compl_date_type_code,
#      start_date,
#      start_date_type_code,
#      primary_purpose_code,
#      primary_purpose_other_text,
#      public_description,
#      public_tittle,
#      section801_indicator,
#      record_verification_date,
#      scientific_description,
#      study_protocol_type,
#      allocation_code,
#      blinding_role_code_subject,
#      blinding_role_code_caregiver,
#      blinding_role_code_investigator,
#      blinding_role_code_outcome,
#      blinding_schema_code,
#      design_configuration_code,
#      number_of_intervention_groups,
#      study_classification_code,
#      bio_specimen_description,
#      bio_specimen_retention_code,
#      sampling_method_code,
#      number_of_groups,
#      study_model_code,
#      study_model_other_text,
#      time_perspective_code,
#      time_perspective_other_text,
#      study_population_description,
#      date_last_created,
#      date_last_updated,
#      status_code,
#      status_date,
#      amendment_number,
#      amendment_date,
#      amendment_reason_code,
#      submission_number,
#      parent_protocol_identifier,
#      program_code_text,
#      min_target_accrual_num,
#      proprietary_trial_indicator,
#      ctgov_xml_required_indicator,
#      user_last_created_id,
#      user_last_updated_id,
#      phase_additional_qualifier_code,
#      primary_purpose_additional_qualifier_code,
#      completion_date,
#      completion_date_type_code,
#      study_subtype_code,
#      comments,
#      processing_priority,
#      assigned_user_id,
#      ctro_override,
#      secondary_purpose_other_text,
#      nci_grant,
#      consortia_trial_category,
#      final_accrual_num,
#      study_source,
#      accrual_disease_code_system,
#      submitting_organization_id,
#      ctro_override_flag_comments,
#      expected_abstraction_completion_date,
#      expected_abstraction_completion_comments,
#      pcd_sent_to_pio_date,
#      pcd_confirm_date,
#      designee_notified_date,
#      reporting_in_process_date,
#      three_month_reminder_date,
#      five_month_reminder_date,
#      seven_month_escalation_to_pio_date,
#      results_sent_to_pio_date,
#      results_approved_by_pio_date,
#      prs_release_date,
#      qa_comments_return_date,
#      trial_published_date,
#      use_standard_language,
#      date_entered_in_prs,
#      designee_acess_revoked,
#      designee_acess_revoked_date,
#      changes_in_ctrp_ctgov,
#      changes_in_ctrp_ctgov_date,
#      send_to_ctgov_updated,
#      nci_id,
#      dcp_id,
#      ccr_id,
#      nct_id,
#      ctep_id,
#      lead_org_id,
#      nih_nci_division_department_identifier,
#      nih_nci_program_identifier
#      )
#     VALUES
#      (
#      '#{@seed_data['identifier'].gsub("'", "")}',
#      '#{@seed_data['accr_rept_meth_code'].gsub("'", "")}',
#      '#{@seed_data['acronym']}',
#      '#{@seed_data['accept_healthy_volunteers_indicator'].gsub("'", "")}',
#      '#{@seed_data['data_monty_comty_apptn_indicator'].gsub("'", "")}',
#      '#{@seed_data['delayed_posting_indicator'].gsub("'", "")}',
#      '#{@seed_data['expd_access_indidicator']}',
#      '#{@seed_data['fda_regulated_indicator'].gsub("'", "")}',
#      '#{@seed_data['review_brd_approval_req_indicator'].gsub("'", "")}',
#      '#{@seed_data['keyword_text']}',
#      '#{@seed_data['official_title'].gsub("'", "")}',
#      '#{@seed_data['max_target_accrual_num']}',
#      '#{@seed_data['phase_code'].gsub("'", "")}',
#      '#{@seed_data['phase_other_text']}',
#      '#{@seed_data['pri_compl_date'].gsub("'", "")}',
#      '#{@seed_data['pri_compl_date_type_code'].gsub("'", "")}',
#      '#{@seed_data['start_date'].gsub("'", "")}',
#      '#{@seed_data['start_date_type_code'].gsub("'", "")}',
#      '#{@seed_data['primary_purpose_code'].gsub("'", "")}',
#      '#{@seed_data['primary_purpose_other_text'].gsub("'", "")}',
#      '#{@seed_data['public_description'].gsub("'", "")}',
#      '#{@seed_data['public_tittle'].gsub("'", "")}',
#      '#{@seed_data['section801_indicator'].gsub("'", "")}',
#      '#{@seed_data['record_verification_date']}',
#      '#{@seed_data['scientific_description']}',
#      '#{@seed_data['study_protocol_type'].gsub("'", "")}',
#      '#{@seed_data['allocation_code'].gsub("'", "")}',
#      '#{@seed_data['blinding_role_code_subject'].gsub("'", "")}',
#      '#{@seed_data['blinding_role_code_caregiver']}',
#      '#{@seed_data['blinding_role_code_investigator']}',
#      '#{@seed_data['blinding_role_code_outcome']}',
#      '#{@seed_data['blinding_schema_code']}',
#      '#{@seed_data['design_configuration_code'].gsub("'", "")}',
#      '#{@seed_data['number_of_intervention_groups'].gsub("'", "")}',
#      '#{@seed_data['study_classification_code']}',
#      '#{@seed_data['bio_specimen_description']}',
#      '#{@seed_data['bio_specimen_retention_code']}',
#      '#{@seed_data['sampling_method_code']}',
#      '#{@seed_data['number_of_groups']}',
#      '#{@seed_data['study_model_code']}',
#      '#{@seed_data['study_model_other_text']}',
#      '#{@seed_data['time_perspective_code']}',
#      '#{@seed_data['time_perspective_other_text']}',
#      '#{@seed_data['study_population_description']}',
#      '#{@seed_data['date_last_created'].gsub("'", "")}',
#      '#{@seed_data['date_last_updated'].gsub("'", "")}',
#      '#{@seed_data['status_code'].gsub("'", "")}',
#      '#{@seed_data['status_date'].gsub("'", "")}',
#      '#{@seed_data['amendment_number']}',
#      '#{@seed_data['amendment_date']}',
#      '#{@seed_data['amendment_reason_code']}',
#      '#{@seed_data['submission_number'].gsub("'", "")}',
#      '#{@seed_data['parent_protocol_identifier']}',
#      '#{@seed_data['program_code_text'].gsub("'", "")}',
#      '#{@seed_data['min_target_accrual_num'].gsub("'", "")}',
#      '#{@seed_data['proprietary_trial_indicator'].gsub("'", "")}',
#      '#{@seed_data['ctgov_xml_required_indicator'].gsub("'", "")}',
#      '#{@seed_data['user_last_created_id'].gsub("'", "")}',
#      '#{@seed_data['user_last_updated_id']}',
#      '#{@seed_data['phase_additional_qualifier_code'].gsub("'", "")}',
#      '#{@seed_data['primary_purpose_additional_qualifier_code'].gsub("'", "")}',
#      '#{@seed_data['completion_date'].gsub("'", "")}',
#      '#{@seed_data['completion_date_type_code'].gsub("'", "")}',
#      '#{@seed_data['study_subtype_code']}',
#      '#{@seed_data['comments']}',
#      '#{@seed_data['processing_priority'].gsub("'", "")}',
#      '#{@seed_data['assigned_user_id']}',
#      '#{@seed_data['ctro_override'].gsub("'", "")}',
#      '#{@seed_data['secondary_purpose_other_text'].gsub("'", "")}',
#      '#{@seed_data['nci_grant'].gsub("'", "")}',
#      '#{@seed_data['consortia_trial_category']}',
#      '#{@seed_data['final_accrual_num']}',
#      '#{@seed_data['study_source'].gsub("'", "")}',
#      '#{@seed_data['accrual_disease_code_system'].gsub("'", "")}',
#      '#{@seed_data['submitting_organization_id'].gsub("'", "")}',
#      '#{@seed_data['ctro_override_flag_comments']}',
#      '#{@seed_data['expected_abstraction_completion_date']}',
#      '#{@seed_data['expected_abstraction_completion_comments']}',
#      '#{@seed_data['pcd_sent_to_pio_date']}',
#      '#{@seed_data['pcd_confirm_date']}',
#      '#{@seed_data['designee_notified_date']}',
#      '#{@seed_data['reporting_in_process_date']}',
#      '#{@seed_data['three_month_reminder_date']}',
#      '#{@seed_data['five_month_reminder_date']}',
#      '#{@seed_data['seven_month_escalation_to_pio_date']}',
#      '#{@seed_data['results_sent_to_pio_date']}',
#      '#{@seed_data['results_approved_by_pio_date']}',
#      '#{@seed_data['prs_release_date']}',
#      '#{@seed_data['qa_comments_return_date']}',
#      '#{@seed_data['trial_published_date']}',
#      '#{@seed_data['use_standard_language']}',
#      '#{@seed_data['date_entered_in_prs']}',
#      '#{@seed_data['designee_acess_revoked']}',
#      '#{@seed_data['designee_acess_revoked_date']}',
#      '#{@seed_data['changes_in_ctrp_ctgov']}',
#      '#{@seed_data['changes_in_ctrp_ctgov_date']}',
#      '#{@seed_data['send_to_ctgov_updated']}',
#      '#{@seed_data['nci_id'].gsub("'", "")}',
#      '#{@seed_data['dcp_id']}',
#      '#{@seed_data['ccr_id']}',
#      '#{@seed_data['nct_id'].gsub("'", "")}',
#      '#{@seed_data['ctep_id']}',
#      '#{@seed_data['lead_org_id'].gsub("'", "")}',
#      '#{@seed_data['nih_nci_division_department_identifier']}',
#      '#{@seed_data['nih_nci_program_identifier']}'
#      );"
#   puts sql_insert_study_protocol
# end
#
#
# #insert_study_protocol_query 'ST20182602A'
#
#
# #02
# def insert_document_workflow_status(seedTrialID)
#      @seed_json_data = read_json_from_dir(@converted_json_dir, @dt4_formula_json)
#      @seed_data = @seed_json_data.find {|x| x['seedTrialID'] == "#{seedTrialID}"}
#      puts @seed_data
# sql_insert_document_workflow_status =
#     "
#       INSERT INTO document_workflow_status (identifier,status_code,comment_text,status_date_range_low,study_protocol_identifier,date_last_created,date_last_updated,status_date_range_high,user_last_created_id,user_last_updated_id,current,previous) VALUES ('#{@seed_data['dws1_identifier'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws1_status_code'].gsub("'", ""){ |m| m == "'" ? m : "" }}', #{@seed_data['dws1_comment_text'].gsub("'", "") { |m| m == "'" ? m : "" }},'#{@seed_data['dws1_status_date_range_low'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws1_study_protocol_identifier'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws1_date_last_created'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws1_date_last_updated'].gsub("'", "") { |m| m == "'" ? m : "" }}', #{@seed_data['dws1_status_date_range_high'].gsub("'", "") { |m| m == "'" ? m : "" }},'#{@seed_data['dws1_user_last_created_id'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws1_user_last_updated_id'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws1_current'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws1_previous'].gsub("'", "") { |m| m == "'" ? m : "" }}');
#       INSERT INTO document_workflow_status (identifier,status_code,comment_text,status_date_range_low,study_protocol_identifier,date_last_created,date_last_updated,status_date_range_high,user_last_created_id,user_last_updated_id,current,previous) VALUES ('#{@seed_data['dws2_identifier'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws2_status_code'].gsub("'", ""){ |m| m == "'" ? m : "" }}', #{@seed_data['dws2_comment_text'].gsub("'", "") { |m| m == "'" ? m : "" }},'#{@seed_data['dws2_status_date_range_low'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws2_study_protocol_identifier'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws2_date_last_created'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws2_date_last_updated'].gsub("'", "") { |m| m == "'" ? m : "" }}', #{@seed_data['dws2_status_date_range_high'].gsub("'", "") { |m| m == "'" ? m : "" }},'#{@seed_data['dws2_user_last_created_id'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws2_user_last_updated_id'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws2_current'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws2_previous'].gsub("'", "") { |m| m == "'" ? m : "" }}');
#       INSERT INTO document_workflow_status (identifier,status_code,comment_text,status_date_range_low,study_protocol_identifier,date_last_created,date_last_updated,status_date_range_high,user_last_created_id,user_last_updated_id,current,previous) VALUES ('#{@seed_data['dws3_identifier'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws3_status_code'].gsub("'", ""){ |m| m == "'" ? m : "" }}', #{@seed_data['dws3_comment_text'].gsub("'", "") { |m| m == "'" ? m : "" }},'#{@seed_data['dws3_status_date_range_low'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws3_study_protocol_identifier'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws3_date_last_created'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws3_date_last_updated'].gsub("'", "") { |m| m == "'" ? m : "" }}', #{@seed_data['dws3_status_date_range_high'].gsub("'", "") { |m| m == "'" ? m : "" }},'#{@seed_data['dws3_user_last_created_id'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws3_user_last_updated_id'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws3_current'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws3_previous'].gsub("'", "") { |m| m == "'" ? m : "" }}');
#       INSERT INTO document_workflow_status (identifier,status_code,comment_text,status_date_range_low,study_protocol_identifier,date_last_created,date_last_updated,status_date_range_high,user_last_created_id,user_last_updated_id,current,previous) VALUES ('#{@seed_data['dws4_identifier'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws4_status_code'].gsub("'", ""){ |m| m == "'" ? m : "" }}', #{@seed_data['dws4_comment_text'].gsub("'", "") { |m| m == "'" ? m : "" }},'#{@seed_data['dws4_status_date_range_low'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws4_study_protocol_identifier'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws4_date_last_created'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws4_date_last_updated'].gsub("'", "") { |m| m == "'" ? m : "" }}', #{@seed_data['dws4_status_date_range_high'].gsub("'", "") { |m| m == "'" ? m : "" }},'#{@seed_data['dws4_user_last_created_id'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws4_user_last_updated_id'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws4_current'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws4_previous'].gsub("'", "") { |m| m == "'" ? m : "" }}');
#       INSERT INTO document_workflow_status (identifier,status_code,comment_text,status_date_range_low,study_protocol_identifier,date_last_created,date_last_updated,status_date_range_high,user_last_created_id,user_last_updated_id,current,previous) VALUES ('#{@seed_data['dws5_identifier'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws5_status_code'].gsub("'", ""){ |m| m == "'" ? m : "" }}', #{@seed_data['dws5_comment_text'].gsub("'", "") { |m| m == "'" ? m : "" }},'#{@seed_data['dws5_status_date_range_low'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws5_study_protocol_identifier'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws5_date_last_created'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws5_date_last_updated'].gsub("'", "") { |m| m == "'" ? m : "" }}', #{@seed_data['dws5_status_date_range_high'].gsub("'", "") { |m| m == "'" ? m : "" }},'#{@seed_data['dws5_user_last_created_id'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws5_user_last_updated_id'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws5_current'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws5_previous'].gsub("'", "") { |m| m == "'" ? m : "" }}');
#       INSERT INTO document_workflow_status (identifier,status_code,comment_text,status_date_range_low,study_protocol_identifier,date_last_created,date_last_updated,status_date_range_high,user_last_created_id,user_last_updated_id,current,previous) VALUES ('#{@seed_data['dws6_identifier'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws6_status_code'].gsub("'", ""){ |m| m == "'" ? m : "" }}', #{@seed_data['dws6_comment_text'].gsub("'", "") { |m| m == "'" ? m : "" }},'#{@seed_data['dws6_status_date_range_low'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws6_study_protocol_identifier'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws6_date_last_created'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws6_date_last_updated'].gsub("'", "") { |m| m == "'" ? m : "" }}', #{@seed_data['dws6_status_date_range_high'].gsub("'", "") { |m| m == "'" ? m : "" }},'#{@seed_data['dws6_user_last_created_id'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws6_user_last_updated_id'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws6_current'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws6_previous'].gsub("'", "") { |m| m == "'" ? m : "" }}');
#       INSERT INTO document_workflow_status (identifier,status_code,comment_text,status_date_range_low,study_protocol_identifier,date_last_created,date_last_updated,status_date_range_high,user_last_created_id,user_last_updated_id,current,previous) VALUES ('#{@seed_data['dws7_identifier'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws7_status_code'].gsub("'", ""){ |m| m == "'" ? m : "" }}', #{@seed_data['dws7_comment_text'].gsub("'", "") { |m| m == "'" ? m : "" }},'#{@seed_data['dws7_status_date_range_low'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws7_study_protocol_identifier'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws7_date_last_created'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws7_date_last_updated'].gsub("'", "") { |m| m == "'" ? m : "" }}', #{@seed_data['dws7_status_date_range_high'].gsub("'", "") { |m| m == "'" ? m : "" }},'#{@seed_data['dws7_user_last_created_id'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws7_user_last_updated_id'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws7_current'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws7_previous'].gsub("'", "") { |m| m == "'" ? m : "" }}');
#       INSERT INTO document_workflow_status (identifier,status_code,comment_text,status_date_range_low,study_protocol_identifier,date_last_created,date_last_updated,status_date_range_high,user_last_created_id,user_last_updated_id,current,previous) VALUES ('#{@seed_data['dws8_identifier'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws8_status_code'].gsub("'", ""){ |m| m == "'" ? m : "" }}', #{@seed_data['dws8_comment_text'].gsub("'", "") { |m| m == "'" ? m : "" }},'#{@seed_data['dws8_status_date_range_low'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws8_study_protocol_identifier'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws8_date_last_created'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws8_date_last_updated'].gsub("'", "") { |m| m == "'" ? m : "" }}', #{@seed_data['dws8_status_date_range_high'].gsub("'", "") { |m| m == "'" ? m : "" }},'#{@seed_data['dws8_user_last_created_id'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws8_user_last_updated_id'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws8_current'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws8_previous'].gsub("'", "") { |m| m == "'" ? m : "" }}');
#       INSERT INTO document_workflow_status (identifier,status_code,comment_text,status_date_range_low,study_protocol_identifier,date_last_created,date_last_updated,status_date_range_high,user_last_created_id,user_last_updated_id,current,previous) VALUES ('#{@seed_data['dws9_identifier'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws9_status_code'].gsub("'", ""){ |m| m == "'" ? m : "" }}', #{@seed_data['dws9_comment_text'].gsub("'", "") { |m| m == "'" ? m : "" }},'#{@seed_data['dws9_status_date_range_low'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws9_study_protocol_identifier'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws9_date_last_created'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws9_date_last_updated'].gsub("'", "") { |m| m == "'" ? m : "" }}', #{@seed_data['dws9_status_date_range_high'].gsub("'", "") { |m| m == "'" ? m : "" }},'#{@seed_data['dws9_user_last_created_id'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws9_user_last_updated_id'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws9_current'].gsub("'", "") { |m| m == "'" ? m : "" }}','#{@seed_data['dws9_previous'].gsub("'", "") { |m| m == "'" ? m : "" }}');
#      "
#      puts sql_insert_document_workflow_status
# end
#
#
# #insert_document_workflow_status 'ST20182602A'
#
# #03
# def insert_planned_activity(seedTrialID)
#      @seed_json_data = read_json_from_dir(@converted_json_dir, @dt4_formula_json)
#      @seed_data = @seed_json_data.find {|x| x['seedTrialID'] == "#{seedTrialID}"}
#      puts @seed_data
# sql_insert_planned_activity =
#     "
#       INSERT INTO planned_activity (identifier,category_code,subcategory_code,lead_product_indicator,text_description,study_protocol_identifier,intervention_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,display_order) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i-165}',#{@seed_data['pactiv1_category_code']},#{@seed_data['pactiv1_subcategory_code'].gsub("'", ""){ |m| m == "'" ? m : "" }},#{@seed_data['pactiv1_lead_product_indicator'].gsub("'", ""){ |m| m == "'" ? m : "" }},#{@seed_data['pactiv1_text_description'].gsub("'", ""){ |m| m == "'" ? m : "" }},#{@seed_data['pactiv1_study_protocol_identifier']},#{@seed_data['pactiv1_intervention_identifier'].gsub("'", ""){ |m| m == "'" ? m : "" }},#{@seed_data['pactiv1_date_last_created'].gsub("'", ""){ |m| m == "'" ? m : "" }},#{@seed_data['pactiv1_date_last_updated']},#{@seed_data['pactiv1_user_last_created_id'].gsub("'", ""){ |m| m == "'" ? m : "" }},#{@seed_data['pactiv1_user_last_updated_id'].gsub("'", ""){ |m| m == "'" ? m : "" }},#{@seed_data['pactiv1_display_order'].gsub("'", ""){ |m| m == "'" ? m : "" }});
#       INSERT INTO planned_activity (identifier,category_code,subcategory_code,lead_product_indicator,text_description,study_protocol_identifier,intervention_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,display_order) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i-164}',#{@seed_data['pactiv2_category_code']},#{@seed_data['pactiv2_subcategory_code'].gsub("'", ""){ |m| m == "'" ? m : "" }},#{@seed_data['pactiv2_lead_product_indicator'].gsub("'", ""){ |m| m == "'" ? m : "" }},#{@seed_data['pactiv2_text_description'].gsub("'", ""){ |m| m == "'" ? m : "" }},#{@seed_data['pactiv2_study_protocol_identifier']},#{@seed_data['pactiv2_intervention_identifier'].gsub("'", ""){ |m| m == "'" ? m : "" }},#{@seed_data['pactiv2_date_last_created'].gsub("'", ""){ |m| m == "'" ? m : "" }},#{@seed_data['pactiv2_date_last_updated']},#{@seed_data['pactiv2_user_last_created_id'].gsub("'", ""){ |m| m == "'" ? m : "" }},#{@seed_data['pactiv2_user_last_updated_id'].gsub("'", ""){ |m| m == "'" ? m : "" }},#{@seed_data['pactiv2_display_order'].gsub("'", ""){ |m| m == "'" ? m : "" }});
#       INSERT INTO planned_activity (identifier,category_code,subcategory_code,lead_product_indicator,text_description,study_protocol_identifier,intervention_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,display_order) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i-163}',#{@seed_data['pactiv3_category_code']},#{@seed_data['pactiv3_subcategory_code'].gsub("'", ""){ |m| m == "'" ? m : "" }},#{@seed_data['pactiv3_lead_product_indicator'].gsub("'", ""){ |m| m == "'" ? m : "" }},#{@seed_data['pactiv3_text_description']},#{@seed_data['pactiv3_study_protocol_identifier']},#{@seed_data['pactiv3_intervention_identifier'].gsub("'", ""){ |m| m == "'" ? m : "" }},#{@seed_data['pactiv3_date_last_created'].gsub("'", ""){ |m| m == "'" ? m : "" }},#{@seed_data['pactiv3_date_last_updated']},#{@seed_data['pactiv3_user_last_created_id'].gsub("'", ""){ |m| m == "'" ? m : "" }},#{@seed_data['pactiv3_user_last_updated_id'].gsub("'", ""){ |m| m == "'" ? m : "" }},#{@seed_data['pactiv3_display_order']});
#       INSERT INTO planned_activity (identifier,category_code,subcategory_code,lead_product_indicator,text_description,study_protocol_identifier,intervention_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,display_order) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i-162}',#{@seed_data['pactiv4_category_code']},#{@seed_data['pactiv4_subcategory_code']},#{@seed_data['pactiv4_lead_product_indicator']},#{@seed_data['pactiv4_text_description'].gsub("'", ""){ |m| m == "'" ? m : "" }},#{@seed_data['pactiv4_study_protocol_identifier']},#{@seed_data['pactiv4_intervention_identifier']},#{@seed_data['pactiv4_date_last_created']},#{@seed_data['pactiv4_date_last_updated']},#{@seed_data['pactiv4_user_last_created_id']},#{@seed_data['pactiv4_user_last_updated_id']},#{@seed_data['pactiv4_display_order'].gsub("'", ""){ |m| m == "'" ? m : "" }});
#       INSERT INTO planned_activity (identifier,category_code,subcategory_code,lead_product_indicator,text_description,study_protocol_identifier,intervention_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,display_order) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i-161}',#{@seed_data['pactiv5_category_code']},#{@seed_data['pactiv5_subcategory_code'].gsub("'", ""){ |m| m == "'" ? m : "" }},#{@seed_data['pactiv5_lead_product_indicator'].gsub("'", ""){ |m| m == "'" ? m : "" }},#{@seed_data['pactiv5_text_description'].gsub("'", ""){ |m| m == "'" ? m : "" }},#{@seed_data['pactiv5_study_protocol_identifier']},#{@seed_data['pactiv5_intervention_identifier'].gsub("'", ""){ |m| m == "'" ? m : "" }},#{@seed_data['pactiv5_date_last_created'].gsub("'", ""){ |m| m == "'" ? m : "" }},#{@seed_data['pactiv5_date_last_updated']},#{@seed_data['pactiv5_user_last_created_id'].gsub("'", ""){ |m| m == "'" ? m : "" }},#{@seed_data['pactiv5_user_last_updated_id'].gsub("'", ""){ |m| m == "'" ? m : "" }},#{@seed_data['pactiv5_display_order'].gsub("'", ""){ |m| m == "'" ? m : "" }});
#       INSERT INTO planned_activity (identifier,category_code,subcategory_code,lead_product_indicator,text_description,study_protocol_identifier,intervention_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,display_order) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i-160}',#{@seed_data['pactiv6_category_code']},#{@seed_data['pactiv6_subcategory_code'].gsub("'", ""){ |m| m == "'" ? m : "" }},#{@seed_data['pactiv6_lead_product_indicator'].gsub("'", ""){ |m| m == "'" ? m : "" }},#{@seed_data['pactiv6_text_description'].gsub("'", ""){ |m| m == "'" ? m : "" }},#{@seed_data['pactiv6_study_protocol_identifier']},#{@seed_data['pactiv6_intervention_identifier'].gsub("'", ""){ |m| m == "'" ? m : "" }},#{@seed_data['pactiv6_date_last_created'].gsub("'", ""){ |m| m == "'" ? m : "" }},#{@seed_data['pactiv6_date_last_updated']},#{@seed_data['pactiv6_user_last_created_id'].gsub("'", ""){ |m| m == "'" ? m : "" }},#{@seed_data['pactiv6_user_last_updated_id'].gsub("'", ""){ |m| m == "'" ? m : "" }},#{@seed_data['pactiv6_display_order'].gsub("'", ""){ |m| m == "'" ? m : "" }});
#       INSERT INTO planned_activity (identifier,category_code,subcategory_code,lead_product_indicator,text_description,study_protocol_identifier,intervention_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,display_order) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i-159}',#{@seed_data['pactiv7_category_code']},#{@seed_data['pactiv7_subcategory_code'].gsub("'", ""){ |m| m == "'" ? m : "" }},#{@seed_data['pactiv7_lead_product_indicator'].gsub("'", ""){ |m| m == "'" ? m : "" }},#{@seed_data['pactiv7_text_description']},#{@seed_data['pactiv7_study_protocol_identifier']},#{@seed_data['pactiv7_intervention_identifier'].gsub("'", ""){ |m| m == "'" ? m : "" }},#{@seed_data['pactiv7_date_last_created'].gsub("'", ""){ |m| m == "'" ? m : "" }},#{@seed_data['pactiv7_date_last_updated']},#{@seed_data['pactiv7_user_last_created_id'].gsub("'", ""){ |m| m == "'" ? m : "" }},#{@seed_data['pactiv7_user_last_updated_id'].gsub("'", ""){ |m| m == "'" ? m : "" }},#{@seed_data['pactiv7_display_order']});
#       INSERT INTO planned_activity (identifier,category_code,subcategory_code,lead_product_indicator,text_description,study_protocol_identifier,intervention_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,display_order) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i-158}',#{@seed_data['pactiv8_category_code']},#{@seed_data['pactiv8_subcategory_code']},#{@seed_data['pactiv8_lead_product_indicator']},#{@seed_data['pactiv8_text_description'].gsub("'", ""){ |m| m == "'" ? m : "" }},#{@seed_data['pactiv8_study_protocol_identifier']},#{@seed_data['pactiv8_intervention_identifier']},#{@seed_data['pactiv8_date_last_created']},#{@seed_data['pactiv8_date_last_updated']},#{@seed_data['pactiv8_user_last_created_id']},#{@seed_data['pactiv8_user_last_updated_id']},#{@seed_data['pactiv8_display_order'].gsub("'", ""){ |m| m == "'" ? m : "" }});
#      "
#      puts sql_insert_planned_activity
# end
#
# # insert_planned_activity 'ST20182602A'
#
# #04
# def insert_study_site(seedTrialID)
#      @seed_json_data = read_json_from_dir(@converted_json_dir, @dt4_formula_json)
#      @seed_data = @seed_json_data.find {|x| x['seedTrialID'] == "#{seedTrialID}"}
#      puts @seed_data
# sql_insert_study_site =
#     "
#     ﻿INSERT INTO study_site (identifier,functional_code,local_sp_indentifier,review_board_approval_number,review_board_approval_date,review_board_approval_status_code,target_accrual_number,study_protocol_identifier,healthcare_facility_identifier,research_organization_identifier,oversight_committee_identifier,status_code,status_date_range_low,date_last_created,date_last_updated,status_date_range_high,review_board_organizational_affiliation,program_code_text,accrual_date_range_low,accrual_date_range_high,user_last_created_id,user_last_updated_id) VALUES (#{@seed_data['stdy_s1_identifier']},'LEAD_ORGANIZATION',#{@seed_data['stdy_s1_local_sp_indentifier']},NULL,NULL,NULL,NULL,#{@seed_data['stdy_s1_study_protocol_identifier']},NULL,'129796',NULL,'PENDING','2018-02-21 08:34:57.602','2018-02-21 08:34:57.602','2018-02-21 08:34:57.602',NULL,NULL,NULL,NULL,NULL,'14','14');
#      INSERT INTO study_site (identifier,functional_code,local_sp_indentifier,review_board_approval_number,review_board_approval_date,review_board_approval_status_code,target_accrual_number,study_protocol_identifier,healthcare_facility_identifier,research_organization_identifier,oversight_committee_identifier,status_code,status_date_range_low,date_last_created,date_last_updated,status_date_range_high,review_board_organizational_affiliation,program_code_text,accrual_date_range_low,accrual_date_range_high,user_last_created_id,user_last_updated_id) VALUES (#{@seed_data['stdy_s2_identifier']},'SPONSOR',NULL,NULL,NULL,NULL,NULL,#{@seed_data['stdy_s2_study_protocol_identifier']},NULL,'129796',NULL,'PENDING','2018-02-21 08:34:58.064','2018-02-21 08:34:58.064','2018-02-21 08:34:58.064',NULL,NULL,NULL,NULL,NULL,'14','14');
#      INSERT INTO study_site (identifier,functional_code,local_sp_indentifier,review_board_approval_number,review_board_approval_date,review_board_approval_status_code,target_accrual_number,study_protocol_identifier,healthcare_facility_identifier,research_organization_identifier,oversight_committee_identifier,status_code,status_date_range_low,date_last_created,date_last_updated,status_date_range_high,review_board_organizational_affiliation,program_code_text,accrual_date_range_low,accrual_date_range_high,user_last_created_id,user_last_updated_id) VALUES (#{@seed_data['stdy_s3_identifier']},'IDENTIFIER_ASSIGNER',#{@seed_data['stdy_s3_local_sp_indentifier']},NULL,NULL,NULL,NULL,'1618195',NULL,'1',NULL,'PENDING','2018-02-21 08:34:58.297','2018-02-21 08:34:58.297','2018-02-21 08:34:58.297',NULL,NULL,NULL,NULL,NULL,'14','14');
#      INSERT INTO study_site (identifier,functional_code,local_sp_indentifier,review_board_approval_number,review_board_approval_date,review_board_approval_status_code,target_accrual_number,study_protocol_identifier,healthcare_facility_identifier,research_organization_identifier,oversight_committee_identifier,status_code,status_date_range_low,date_last_created,date_last_updated,status_date_range_high,review_board_organizational_affiliation,program_code_text,accrual_date_range_low,accrual_date_range_high,user_last_created_id,user_last_updated_id) VALUES (#{@seed_data['stdy_s4_identifier']},'FUNDING_SOURCE',NULL,NULL,NULL,NULL,NULL,#{@seed_data['stdy_s4_study_protocol_identifier']},NULL,'4',NULL,'PENDING','2018-02-21 08:34:58.53','2018-02-21 08:34:58.53','2018-02-21 08:34:58.53',NULL,NULL,NULL,NULL,NULL,'14','14');
#     "
#      puts sql_insert_study_site
# end
#
# #insert_study_site 'ST20182602A'
#
# #05
# def insert_study_milestone(seedTrialID)
#      @seed_json_data = read_json_from_dir(@converted_json_dir, @dt4_formula_json)
#      @seed_data = @seed_json_data.find {|x| x['seedTrialID'] == "#{seedTrialID}"}
#      puts @seed_data
# sql_insert_study_milestone =
#     "
#      INSERT INTO study_milestone (identifier,comment_text,milestone_code,milestone_date,study_protocol_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,rejection_reason_code,active,admin,last,other,scientific) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+0}',NULL,'SUBMISSION_RECEIVED','2018-02-21 08:34:56.597','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','2018-02-21 08:34:56.81','2018-02-21 08:34:56.81','14','14',NULL,'f','f','f','f','f');
#      INSERT INTO study_milestone (identifier,comment_text,milestone_code,milestone_date,study_protocol_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,rejection_reason_code,active,admin,last,other,scientific) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+1}',NULL,'SUBMISSION_ACCEPTED','2018-02-21 13:37:24.422969','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','2018-02-21 13:37:24.422969','2018-02-21 13:37:24.422969','14','14',NULL,'f','f','f','f','f');
#      INSERT INTO study_milestone (identifier,comment_text,milestone_code,milestone_date,study_protocol_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,rejection_reason_code,active,admin,last,other,scientific) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+2}',NULL,'ADMINISTRATIVE_PROCESSING_START_DATE','2018-02-21 13:37:24.422969','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','2018-02-21 13:37:24.422969','2018-02-21 13:37:24.422969','14','14',NULL,'f','f','f','f','f');
#      INSERT INTO study_milestone (identifier,comment_text,milestone_code,milestone_date,study_protocol_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,rejection_reason_code,active,admin,last,other,scientific) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+3}',NULL,'ADMINISTRATIVE_PROCESSING_COMPLETED_DATE','2018-02-21 13:37:24.422969','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','2018-02-21 13:37:24.422969','2018-02-21 13:37:24.422969','14','14',NULL,'f','f','f','f','f');
#      INSERT INTO study_milestone (identifier,comment_text,milestone_code,milestone_date,study_protocol_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,rejection_reason_code,active,admin,last,other,scientific) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+4}',NULL,'ADMINISTRATIVE_READY_FOR_QC','2018-02-21 13:37:24.422969','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','2018-02-21 13:37:24.422969','2018-02-21 13:37:24.422969','14','14',NULL,'f','f','f','f','f');
#      INSERT INTO study_milestone (identifier,comment_text,milestone_code,milestone_date,study_protocol_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,rejection_reason_code,active,admin,last,other,scientific) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+5}',NULL,'ADMINISTRATIVE_QC_START','2018-02-21 13:37:24.422969','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','2018-02-21 13:37:24.422969','2018-02-21 13:37:24.422969','14','14',NULL,'f','f','f','f','f');
#      INSERT INTO study_milestone (identifier,comment_text,milestone_code,milestone_date,study_protocol_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,rejection_reason_code,active,admin,last,other,scientific) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+6}',NULL,'ADMINISTRATIVE_QC_COMPLETE','2018-02-21 13:37:24.422969','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','2018-02-21 13:37:24.422969','2018-02-21 13:37:24.422969','14','14',NULL,'f','f','f','f','f');
#      INSERT INTO study_milestone (identifier,comment_text,milestone_code,milestone_date,study_protocol_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,rejection_reason_code,active,admin,last,other,scientific) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+7}',NULL,'SCIENTIFIC_PROCESSING_START_DATE','2018-02-21 13:37:24.422969','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','2018-02-21 13:37:24.422969','2018-02-21 13:37:24.422969','14','14',NULL,'f','f','f','f','f');
#      INSERT INTO study_milestone (identifier,comment_text,milestone_code,milestone_date,study_protocol_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,rejection_reason_code,active,admin,last,other,scientific) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+8}',NULL,'SCIENTIFIC_PROCESSING_COMPLETED_DATE','2018-02-21 13:37:24.422969','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','2018-02-21 13:37:24.422969','2018-02-21 13:37:24.422969','14','14',NULL,'f','f','f','f','f');
#      INSERT INTO study_milestone (identifier,comment_text,milestone_code,milestone_date,study_protocol_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,rejection_reason_code,active,admin,last,other,scientific) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+9}',NULL,'SCIENTIFIC_READY_FOR_QC','2018-02-21 13:37:24.422969','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','2018-02-21 13:37:24.422969','2018-02-21 13:37:24.422969','14','14',NULL,'f','f','f','f','f');
#      INSERT INTO study_milestone (identifier,comment_text,milestone_code,milestone_date,study_protocol_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,rejection_reason_code,active,admin,last,other,scientific) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+10}',NULL,'SCIENTIFIC_QC_START','2018-02-21 13:37:24.422969','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','2018-02-21 13:37:24.422969','2018-02-21 13:37:24.422969','14','14',NULL,'f','f','f','f','f');
#      INSERT INTO study_milestone (identifier,comment_text,milestone_code,milestone_date,study_protocol_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,rejection_reason_code,active,admin,last,other,scientific) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+11}',NULL,'SCIENTIFIC_QC_COMPLETE','2018-02-21 13:37:24.422969','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','2018-02-21 13:37:24.422969','2018-02-21 13:37:24.422969','14','14',NULL,'f','f','f','f','f');
#      INSERT INTO study_milestone (identifier,comment_text,milestone_code,milestone_date,study_protocol_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,rejection_reason_code,active,admin,last,other,scientific) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+12}',NULL,'READY_FOR_TSR','2018-02-21 13:37:24.422969','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','2018-02-21 13:37:24.422969','2018-02-21 13:37:24.422969','14','14',NULL,'f','f','f','f','f');
#      INSERT INTO study_milestone (identifier,comment_text,milestone_code,milestone_date,study_protocol_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,rejection_reason_code,active,admin,last,other,scientific) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+13}',NULL,'TRIAL_SUMMARY_REPORT','2018-02-21 13:37:24.422969','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','2018-02-21 13:37:24.422969','2018-02-21 13:37:24.422969','14','14',NULL,'f','f','f','f','f');
#      INSERT INTO study_milestone (identifier,comment_text,milestone_code,milestone_date,study_protocol_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,rejection_reason_code,active,admin,last,other,scientific) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+14}',NULL,'TRIAL_SUMMARY_FEEDBACK','2018-02-21 13:37:24.422969','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','2018-02-21 13:37:24.422969','2018-02-21 13:37:24.422969','14','14',NULL,'f','f','f','f','f');
#      INSERT INTO study_milestone (identifier,comment_text,milestone_code,milestone_date,study_protocol_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,rejection_reason_code,active,admin,last,other,scientific) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+15}',NULL,'INITIAL_ABSTRACTION_VERIFY','2018-02-21 13:37:24.422969','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','2018-02-21 13:37:24.422969','2018-02-21 13:37:24.422969','14','14',NULL,'f','f','f','f','f');
#      INSERT INTO study_milestone (identifier,comment_text,milestone_code,milestone_date,study_protocol_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,rejection_reason_code,active,admin,last,other,scientific) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+16}',NULL,'ONGOING_ABSTRACTION_VERIFICATION','2018-02-21 13:37:24.422969','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','2018-02-21 13:37:24.422969','2018-02-21 13:37:24.422969','14','14',NULL,'f','f','f','f','f');
#      INSERT INTO study_milestone (identifier,comment_text,milestone_code,milestone_date,study_protocol_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,rejection_reason_code,active,admin,last,other,scientific) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+17}',NULL,'SUBMISSION_ACCEPTED','2018-02-21 13:37:38.536856','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','2018-02-21 13:37:38.536856','2018-02-21 13:37:38.536856','14','14',NULL,'f','f','f','f','f');
#      INSERT INTO study_milestone (identifier,comment_text,milestone_code,milestone_date,study_protocol_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,rejection_reason_code,active,admin,last,other,scientific) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+18}',NULL,'ADMINISTRATIVE_PROCESSING_START_DATE','2018-02-21 13:38:55.674961','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','2018-02-21 13:38:55.674961','2018-02-21 13:38:55.674961','14','14',NULL,'f','f','f','f','f');
#      INSERT INTO study_milestone (identifier,comment_text,milestone_code,milestone_date,study_protocol_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,rejection_reason_code,active,admin,last,other,scientific) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+19}',NULL,'ADMINISTRATIVE_PROCESSING_COMPLETED_DATE','2018-02-21 13:38:59.716404','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','2018-02-21 13:38:59.716404','2018-02-21 13:38:59.716404','14','14',NULL,'f','f','f','f','f');
#      INSERT INTO study_milestone (identifier,comment_text,milestone_code,milestone_date,study_protocol_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,rejection_reason_code,active,admin,last,other,scientific) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+20}',NULL,'ADMINISTRATIVE_READY_FOR_QC','2018-02-21 13:39:02.938099','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','2018-02-21 13:39:02.938099','2018-02-21 13:39:02.938099','14','14',NULL,'f','f','f','f','f');
#      INSERT INTO study_milestone (identifier,comment_text,milestone_code,milestone_date,study_protocol_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,rejection_reason_code,active,admin,last,other,scientific) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+21}',NULL,'ADMINISTRATIVE_QC_START','2018-02-21 13:39:06.937205','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','2018-02-21 13:39:06.937205','2018-02-21 13:39:06.937205','14','14',NULL,'f','f','f','f','f');
#      INSERT INTO study_milestone (identifier,comment_text,milestone_code,milestone_date,study_protocol_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,rejection_reason_code,active,admin,last,other,scientific) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+22}',NULL,'ADMINISTRATIVE_QC_COMPLETE','2018-02-21 13:39:09.623154','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','2018-02-21 13:39:09.623154','2018-02-21 13:39:09.623154','14','14',NULL,'f','f','f','f','f');
#      INSERT INTO study_milestone (identifier,comment_text,milestone_code,milestone_date,study_protocol_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,rejection_reason_code,active,admin,last,other,scientific) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+23}',NULL,'SCIENTIFIC_PROCESSING_START_DATE','2018-02-21 13:39:13.095197','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','2018-02-21 13:39:13.095197','2018-02-21 13:39:13.095197','14','14',NULL,'f','f','f','f','f');
#      INSERT INTO study_milestone (identifier,comment_text,milestone_code,milestone_date,study_protocol_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,rejection_reason_code,active,admin,last,other,scientific) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+24}',NULL,'SCIENTIFIC_PROCESSING_COMPLETED_DATE','2018-02-21 13:39:15.935163','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','2018-02-21 13:39:15.935163','2018-02-21 13:39:15.935163','14','14',NULL,'f','f','f','f','f');
#      INSERT INTO study_milestone (identifier,comment_text,milestone_code,milestone_date,study_protocol_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,rejection_reason_code,active,admin,last,other,scientific) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+25}',NULL,'SCIENTIFIC_READY_FOR_QC','2018-02-21 13:39:20.769074','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','2018-02-21 13:39:20.769074','2018-02-21 13:39:20.769074','14','14',NULL,'f','f','f','f','f');
#      INSERT INTO study_milestone (identifier,comment_text,milestone_code,milestone_date,study_protocol_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,rejection_reason_code,active,admin,last,other,scientific) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+26}',NULL,'SCIENTIFIC_QC_START','2018-02-21 13:39:24.896474','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','2018-02-21 13:39:24.896474','2018-02-21 13:39:24.896474','14','14',NULL,'f','f','f','f','f');
#      INSERT INTO study_milestone (identifier,comment_text,milestone_code,milestone_date,study_protocol_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,rejection_reason_code,active,admin,last,other,scientific) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+27}',NULL,'SCIENTIFIC_QC_COMPLETE','2018-02-21 13:39:27.829469','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','2018-02-21 13:39:27.829469','2018-02-21 13:39:27.829469','14','14',NULL,'f','f','f','f','f');
#      INSERT INTO study_milestone (identifier,comment_text,milestone_code,milestone_date,study_protocol_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,rejection_reason_code,active,admin,last,other,scientific) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+28}',NULL,'READY_FOR_TSR','2018-02-21 13:39:32.250555','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','2018-02-21 13:39:32.250555','2018-02-21 13:39:32.250555','14','14',NULL,'f','f','f','f','f');
#      INSERT INTO study_milestone (identifier,comment_text,milestone_code,milestone_date,study_protocol_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,rejection_reason_code,active,admin,last,other,scientific) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+29}',NULL,'TRIAL_SUMMARY_REPORT','2018-02-21 13:39:38.835382','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','2018-02-21 13:39:38.835382','2018-02-21 13:39:38.835382','14','14',NULL,'f','f','f','f','f');
#      INSERT INTO study_milestone (identifier,comment_text,milestone_code,milestone_date,study_protocol_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,rejection_reason_code,active,admin,last,other,scientific) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+30}',NULL,'TRIAL_SUMMARY_FEEDBACK','2018-02-21 13:39:45.275444','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','2018-02-21 13:39:45.275444','2018-02-21 13:39:45.275444','14','14',NULL,'f','f','f','f','f');
#      INSERT INTO study_milestone (identifier,comment_text,milestone_code,milestone_date,study_protocol_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,rejection_reason_code,active,admin,last,other,scientific) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+31}',NULL,'INITIAL_ABSTRACTION_VERIFY','2018-02-21 13:39:48.503572','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','2018-02-21 13:39:48.503572','2018-02-21 13:39:48.503572','14','14',NULL,'f','f','f','f','f');
#      INSERT INTO study_milestone (identifier,comment_text,milestone_code,milestone_date,study_protocol_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,rejection_reason_code,active,admin,last,other,scientific) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+32}',NULL,'ONGOING_ABSTRACTION_VERIFICATION','2018-02-21 13:39:55.73705','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','2018-02-21 13:39:55.73705','2018-02-21 13:39:55.73705','14','14',NULL,'t','f','t','t','f');
#     "
#      puts sql_insert_study_milestone
# end
#
# #insert_study_milestone 'ST20182602A'
#
# #06
# def insert_study_overall_status(seedTrialID)
#      @seed_json_data = read_json_from_dir(@converted_json_dir, @dt4_formula_json)
#      @seed_data = @seed_json_data.find {|x| x['seedTrialID'] == "#{seedTrialID}"}
#      puts @seed_data
# sql_insert_study_overall_status =
#      "
#       INSERT INTO study_overall_status (identifier,comment_text,status_code,status_date,study_protocol_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,system_created,addl_comments,deleted,current,position_in_history) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+8}',NULL,'IN_REVIEW','2014-07-15 00:00:00','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}',NULL,'2018-02-21 08:34:56.963',NULL,NULL,'f',NULL,'f','t','0');
#      "
#      puts sql_insert_study_overall_status
# end
#
# # insert_study_overall_status 'ST20182602A'
#
#
# #07
# def insert_study_resourcing(seedTrialID)
#      @seed_json_data = read_json_from_dir(@converted_json_dir, @dt4_formula_json)
#      @seed_data = @seed_json_data.find {|x| x['seedTrialID'] == "#{seedTrialID}"}
#      puts @seed_data
# sql_insert_study_resourcing =
#     "
#       INSERT INTO study_resourcing (identifier,type_code,summ_4_rept_indicator,organization_identifier,study_protocol_identifier,funding_mechanism_code,nih_institute_code,nci_division_program_code,serial_number,active_indicator,inactive_comment_text,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,funding_percent) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+35}',NULL,'f',NULL,'#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','B09','AA','CCR','111111','t',NULL,'2018-02-21 08:34:57.128','2018-02-21 08:34:57.128','14','14','100');
#       INSERT INTO study_resourcing (identifier,type_code,summ_4_rept_indicator,organization_identifier,study_protocol_identifier,funding_mechanism_code,nih_institute_code,nci_division_program_code,serial_number,active_indicator,inactive_comment_text,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,funding_percent) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+36}','EXTERNALLY_PEER_REVIEWED','t','129718','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}',NULL,NULL,NULL,NULL,'t',NULL,'2018-02-21 08:34:57.277','2018-02-21 08:34:57.277','14','14',NULL);
#      "
#      puts sql_insert_study_resourcing
# end
#
# # insert_study_resourcing 'ST20182602A'
#
# #08
# def insert_study_otheridentifiers(seedTrialID)
#      @seed_json_data = read_json_from_dir(@converted_json_dir, @dt4_formula_json)
#      @seed_data = @seed_json_data.find {|x| x['seedTrialID'] == "#{seedTrialID}"}
#      puts @seed_data
# sql_insert_study_otheridentifiers =
#     "
#       INSERT INTO study_otheridentifiers (study_protocol_id,null_flavor,displayable,extension,identifier_name,reliability,root,scope) VALUES ('#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}',NULL,NULL,'#{@seed_data['study_otheridentifiers_extension1'].gsub("'", "")}','Study Protocol Other Identifier',NULL,'2.16.840.1.113883.19',NULL);
#       INSERT INTO study_otheridentifiers (study_protocol_id,null_flavor,displayable,extension,identifier_name,reliability,root,scope) VALUES ('#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}',NULL,NULL,'#{@seed_data['study_otheridentifiers_extension2'].gsub("'", "")}','NCI study protocol entity identifier',NULL,'2.16.840.1.113883.3.26.4.3',NULL);
#      "
#      puts sql_insert_study_otheridentifiers
# end
#
# # insert_study_otheridentifiers 'ST20182602A'
#
# #09
# def insert_study_disease(seedTrialID)
#      @seed_json_data = read_json_from_dir(@converted_json_dir, @dt4_formula_json)
#      @seed_data = @seed_json_data.find {|x| x['seedTrialID'] == "#{seedTrialID}"}
#      puts @seed_data
# sql_insert_study_disease =
#     "
#       INSERT INTO study_disease (identifier,study_protocol_identifier,disease_identifier,lead_disease_indicator,date_last_created,date_last_updated,ctgovxml_indicator,user_last_created_id,user_last_updated_id) VALUES ('#{@seed_data['study_disease_identifier1'].gsub("'", "")}','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','#{@seed_data['study_disease_disease_identifier'].gsub("'", "")}',NULL,'2018-02-21 13:37:24.422969','2018-02-21 13:37:24.422969','t','14','14');
#       INSERT INTO study_disease (identifier,study_protocol_identifier,disease_identifier,lead_disease_indicator,date_last_created,date_last_updated,ctgovxml_indicator,user_last_created_id,user_last_updated_id) VALUES ('#{@seed_data['study_disease_identifier2'].gsub("'", "")}','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','#{@seed_data['study_disease_disease_identifier'].gsub("'", "")}',NULL,'2018-02-21 13:38:42.535208','2018-02-21 13:38:42.535208','t','14','14');
#      "
#      puts sql_insert_study_disease
# end
#
# # insert_study_disease 'ST20182602A'
#
# #10
# def insert_study_outcome_measure(seedTrialID)
#      @seed_json_data = read_json_from_dir(@converted_json_dir, @dt4_formula_json)
#      @seed_data = @seed_json_data.find {|x| x['seedTrialID'] == "#{seedTrialID}"}
#      puts @seed_data
# sql_insert_study_outcome_measure =
#     "
#       INSERT INTO study_outcome_measure (identifier,name,timeframe,study_protocol_identifier,primary_indicator,safety_indicator,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,description,display_order,type_code) VALUES ('1617076','measure 1','measure timeframe 1','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}',NULL,NULL,'2018-02-21 13:37:24.422969','2018-02-21 13:37:24.422969','14','14',NULL,NULL,'PRIMARY');
#       INSERT INTO study_outcome_measure (identifier,name,timeframe,study_protocol_identifier,primary_indicator,safety_indicator,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,description,display_order,type_code) VALUES ('1617077','measure 1','measure timeframe 1','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}',NULL,NULL,'2018-02-21 13:38:01.419347','2018-02-21 13:38:01.419347','14','14',NULL,NULL,'PRIMARY');
#      "
#      puts sql_insert_study_outcome_measure
# end
#
# # insert_study_outcome_measure 'ST20182602A'
#
# #11
# def insert_study_indlde(seedTrialID)
#      @seed_json_data = read_json_from_dir(@converted_json_dir, @dt4_formula_json)
#      @seed_data = @seed_json_data.find {|x| x['seedTrialID'] == "#{seedTrialID}"}
#      puts @seed_data
# sql_insert_study_indlde =
#     "
#       INSERT INTO study_indlde (identifier,expanded_access_status_code,expanded_access_indicator,grantor_code,nih_inst_holder_code,nci_div_prog_holder_code,holder_type_code,indlde_number,indlde_type_code,study_protocol_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,exempt_indicator) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+21}','AVAILABLE','t','CDER','NEI',NULL,'NIH','111111','IND','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','2018-02-21 08:34:57.051','2018-02-21 08:34:57.051','14','14','t');
#       INSERT INTO study_indlde (identifier,expanded_access_status_code,expanded_access_indicator,grantor_code,nih_inst_holder_code,nci_div_prog_holder_code,holder_type_code,indlde_number,indlde_type_code,study_protocol_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,exempt_indicator) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+34}','AVAILABLE','t','CDRH',NULL,'CCR','NCI','222222','IDE','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','2018-02-21 08:34:57.09','2018-02-21 08:34:57.09','14','14','t');
#      "
#      puts sql_insert_study_indlde
# end
#
# # insert_study_indlde 'ST20182602A'
#
# #12
# def insert_study_owner(seedTrialID)
#      @seed_json_data = read_json_from_dir(@converted_json_dir, @dt4_formula_json)
#      @seed_data = @seed_json_data.find {|x| x['seedTrialID'] == "#{seedTrialID}"}
#      puts @seed_data
# sql_insert_study_owner =
#     "
#       INSERT INTO study_owner (study_id,user_id,enable_emails) VALUES ('#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','#{@seed_data['study_owner_user_id'].gsub("'", "")}','t');
#      "
#      puts sql_insert_study_owner
# end
#
# # insert_study_owner 'ST20182602A'
#
# #####
#
# #13
# def insert_study_recruitment_status(seedTrialID)
#      @seed_json_data = read_json_from_dir(@converted_json_dir, @dt4_formula_json)
#      @seed_data = @seed_json_data.find {|x| x['seedTrialID'] == "#{seedTrialID}"}
#      puts @seed_data
# sql_insert_study_recruitment_status =
#      "
#       INSERT INTO study_recruitment_status (identifier,status_code,status_date,study_protocol_identifier,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+9}','#{@seed_data['study_recruitment_status_status_code'].gsub("'", "")}','#{@seed_data['study_recruitment_status_status_date'].gsub("'", "")}','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}',NULL,NULL,NULL,NULL);
#      "
#      puts sql_insert_study_recruitment_status
# end
#
# # insert_study_recruitment_status 'ST20182602A'
#
#
# #14
# def insert_study_protocol_sec_purpose(seedTrialID)
#      @seed_json_data = read_json_from_dir(@converted_json_dir, @dt4_formula_json)
#      @seed_data = @seed_json_data.find {|x| x['seedTrialID'] == "#{seedTrialID}"}
#      puts @seed_data
# sql_insert_study_protocol_sec_purpose =
#      "
#       INSERT INTO study_protocol_sec_purpose (identifier,secondary_purpose_id,study_protocol_id) VALUES ('#{@seed_data['study_protocol_sec_purpose_identifier'].gsub("'", "")}','#{@seed_data['study_protocol_sec_purpose_secondary_purpose_id'].gsub("'", "")}','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}');
#      "
#      puts sql_insert_study_protocol_sec_purpose
# end
#
# # insert_study_protocol_sec_purpose 'ST20182602A'
#
#
# #15 ---- no need to execute following sql insert query
# def insert_webservice_access_log(seedTrialID)
#      @seed_json_data = read_json_from_dir(@converted_json_dir, @dt4_formula_json)
#      @seed_data = @seed_json_data.find {|x| x['seedTrialID'] == "#{seedTrialID}"}
#      puts @seed_data
# sql_insert_webservice_access_log =
#     "
#       INSERT INTO webservice_access_log (identifier,datetime,client_ip,client_username,uri,method,headers,payload,response,response_code,processing_time,processing_errors) VALUES ('1618194','2018-02-21 08:34:32.99','172.18.0.1','ctrpsubstractor','/services/trials/complete/','POST','host=localhost:18080\nconnection=keep-alive\ncontent-length=4516\naccept=application/xml\npostman-token=8fe8effb-61da-a534-e4c5-a34613f33fec\ncache-control=no-cache\norigin=chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop\nuser-agent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.167 Safari/537.36\nauthorization=*********\ncontent-type=application/xml\naccept-encoding=gzip, deflate, br\naccept-language=en-US,en;q=0.9\ncookie=JSESSIONID=syajca7WdyZiqoJN+WrkNoFO\n','<tns:CompleteTrialRegistration xmlns:tns=\"gov.nih.nci.pa.webservices.types\"\n                               xmlns:tns1=\"gov.nih.nci.po.webservices.types.trimmed\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n                               xsi:schemaLocation=\"gov.nih.nci.pa.webservices.types ../../src/resources/ws.xsd \">\n\n  <tns:clinicalTrialsDotGovXmlRequired>true</tns:clinicalTrialsDotGovXmlRequired>\n  <tns:leadOrgTrialID>UPCC 348-02 II - sa1</tns:leadOrgTrialID>\n  <tns:clinicalTrialsDotGovTrialID>NCT91914266</tns:clinicalTrialsDotGovTrialID>\n  <tns:otherTrialID>818280234</tns:otherTrialID>\n  <tns:title>A Phase I/II Study Of Brentuximab Vedotin In Combination With Multi-Agent Chemotherapy II</tns:title>\n  <tns:phase>I</tns:phase>\n  <tns:pilot>false</tns:pilot>\n  <tns:accrualDiseaseTerminology>ICD10</tns:accrualDiseaseTerminology>\n  <tns:primaryPurpose>Other</tns:primaryPurpose>\n  <tns:primaryPurposeOtherDescription>Determine maximum tolerated dose (MTD) of brentuximab vedotin</tns:primaryPurposeOtherDescription>\n  <tns:interventionalDesign>\n    <tns:secondaryPurpose>Other</tns:secondaryPurpose>\n    <tns:secondaryPurposeOtherDescription>Secondary Other Description</tns:secondaryPurposeOtherDescription>\n  </tns:interventionalDesign>\n  <tns:leadOrganization>\n    <tns:existingOrganization>\n      <tns:poID>181802</tns:poID>\n    </tns:existingOrganization>\n  </tns:leadOrganization>\n  <tns:pi>\n    <tns:existingPerson>\n      <tns:poID>5000</tns:poID>\n    </tns:existingPerson>\n  </tns:pi>\n  <tns:sponsor>\n    <tns:existingOrganization>\n      <tns:poID>181802</tns:poID>\n    </tns:existingOrganization>\n  </tns:sponsor>\n  <tns:responsibleParty>\n    <tns:type>Sponsor-Investigator</tns:type>\n    <tns:investigator>\n      <tns:existingPerson>\n        <tns:poID>5000</tns:poID>\n      </tns:existingPerson>\n    </tns:investigator>\n    <tns:investigatorTitle>CEO &amp; Chairman</tns:investigatorTitle>\n  </tns:responsibleParty>\n  <tns:summary4FundingSponsor>\n    <tns:existingOrganization>\n      <tns:poID>181802</tns:poID>\n    </tns:existingOrganization>\n  </tns:summary4FundingSponsor>\n  <tns:programCode>PG00001</tns:programCode>\n  <tns:fundedByNciGrant>false</tns:fundedByNciGrant>\n  <tns:grant>\n    <tns:fundingMechanism>B09</tns:fundingMechanism>\n    <tns:nihInstitutionCode>AA</tns:nihInstitutionCode>\n    <tns:serialNumber>111111</tns:serialNumber>\n    <tns:nciDivisionProgramCode>CCR</tns:nciDivisionProgramCode>\n    <tns:fundingPercentage>100.0</tns:fundingPercentage>\n  </tns:grant>\n  <tns:trialStatus>In Review</tns:trialStatus>\n  <tns:whyStopped></tns:whyStopped>\n  <tns:trialStatusDate>2014-07-15</tns:trialStatusDate>\n  <tns:trialStartDate type=\"Actual\">2014-07-15</tns:trialStartDate>\n  <tns:primaryCompletionDate type=\"Anticipated\">2019-07-15</tns:primaryCompletionDate>\n  <tns:completionDate type=\"Anticipated\">2019-07-15</tns:completionDate>\n  <tns:ind>\n    <tns:number>111111</tns:number>\n    <tns:grantor>CDER</tns:grantor>\n    <tns:holderType>NIH</tns:holderType>\n    <tns:nihInstitution>NEI</tns:nihInstitution>\n    <tns:expandedAccess>true</tns:expandedAccess>\n    <tns:expandedAccessType>Available</tns:expandedAccessType>\n    <tns:exempt>true</tns:exempt>\n  </tns:ind>\n  <tns:ide>\n    <tns:number>222222</tns:number>\n    <tns:grantor>CDRH</tns:grantor>\n    <tns:holderType>NCI</tns:holderType>\n    <tns:nciDivisionProgramCode>CCR</tns:nciDivisionProgramCode>\n    <tns:expandedAccess>true</tns:expandedAccess>\n    <tns:expandedAccessType>Available</tns:expandedAccessType>\n    <tns:exempt>true</tns:exempt>\n  </tns:ide>\n  <tns:regulatoryInformation>\n    <tns:country>USA</tns:country>\n    <tns:authorityName>Federal Government</tns:authorityName>\n    <tns:fdaRegulated>true</tns:fdaRegulated>\n    <tns:section801>true</tns:section801>\n    <tns:delayedPosting>true</tns:delayedPosting>\n    <tns:dataMonitoringCommitteeAppointed>true</tns:dataMonitoringCommitteeAppointed>\n  </tns:regulatoryInformation>\n  <tns:protocolDocument filename=\"protocol.pdf\">dGVzdA==</tns:protocolDocument>\n  <tns:irbApprovalDocument filename=\"irb.pdf\">dGVzdA==</tns:irbApprovalDocument>\n  <tns:participatingSitesDocument\n          filename=\"sites.pdf\">dGVzdA==</tns:participatingSitesDocument>\n  <tns:informedConsentDocument filename=\"consent.pdf\">dGVzdA==</tns:informedConsentDocument>\n  <tns:otherDocument filename=\"other.pdf\">dGVzdA==</tns:otherDocument>\n  <tns:category>Externally Peer-Reviewed</tns:category>\n  <tns:trialOwner>qatest@nih.gov</tns:trialOwner>\n</tns:CompleteTrialRegistration>\n','JBAS014580: Unexpected Error','500','1012','');
#       INSERT INTO webservice_access_log (identifier,datetime,client_ip,client_username,uri,method,headers,payload,response,response_code,processing_time,processing_errors) VALUES ('1618428','2018-02-21 08:34:55.261','172.18.0.1','ctrpsubstractor','/services/trials/complete/','POST','host=localhost:18080\nconnection=keep-alive\ncontent-length=4516\naccept=application/xml\npostman-token=67d3475f-2ca6-739b-c640-9757b881060b\ncache-control=no-cache\norigin=chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop\nuser-agent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.167 Safari/537.36\nauthorization=*********\ncontent-type=application/xml\naccept-encoding=gzip, deflate, br\naccept-language=en-US,en;q=0.9\ncookie=JSESSIONID=syajca7WdyZiqoJN+WrkNoFO\n','<tns:CompleteTrialRegistration xmlns:tns=\"gov.nih.nci.pa.webservices.types\"\n                               xmlns:tns1=\"gov.nih.nci.po.webservices.types.trimmed\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n                               xsi:schemaLocation=\"gov.nih.nci.pa.webservices.types ../../src/resources/ws.xsd \">\n\n  <tns:clinicalTrialsDotGovXmlRequired>true</tns:clinicalTrialsDotGovXmlRequired>\n  <tns:leadOrgTrialID>UPCC 348-02 II - sa2</tns:leadOrgTrialID>\n  <tns:clinicalTrialsDotGovTrialID>NCT91914277</tns:clinicalTrialsDotGovTrialID>\n  <tns:otherTrialID>818280244</tns:otherTrialID>\n  <tns:title>A Phase I/II Study Of Brentuximab Vedotin In Combination With Multi-Agent Chemotherapy II</tns:title>\n  <tns:phase>I</tns:phase>\n  <tns:pilot>false</tns:pilot>\n  <tns:accrualDiseaseTerminology>ICD10</tns:accrualDiseaseTerminology>\n  <tns:primaryPurpose>Other</tns:primaryPurpose>\n  <tns:primaryPurposeOtherDescription>Determine maximum tolerated dose (MTD) of brentuximab vedotin</tns:primaryPurposeOtherDescription>\n  <tns:interventionalDesign>\n    <tns:secondaryPurpose>Other</tns:secondaryPurpose>\n    <tns:secondaryPurposeOtherDescription>Secondary Other Description</tns:secondaryPurposeOtherDescription>\n  </tns:interventionalDesign>\n  <tns:leadOrganization>\n    <tns:existingOrganization>\n      <tns:poID>181802</tns:poID>\n    </tns:existingOrganization>\n  </tns:leadOrganization>\n  <tns:pi>\n    <tns:existingPerson>\n      <tns:poID>5000</tns:poID>\n    </tns:existingPerson>\n  </tns:pi>\n  <tns:sponsor>\n    <tns:existingOrganization>\n      <tns:poID>181802</tns:poID>\n    </tns:existingOrganization>\n  </tns:sponsor>\n  <tns:responsibleParty>\n    <tns:type>Sponsor-Investigator</tns:type>\n    <tns:investigator>\n      <tns:existingPerson>\n        <tns:poID>5000</tns:poID>\n      </tns:existingPerson>\n    </tns:investigator>\n    <tns:investigatorTitle>CEO &amp; Chairman</tns:investigatorTitle>\n  </tns:responsibleParty>\n  <tns:summary4FundingSponsor>\n    <tns:existingOrganization>\n      <tns:poID>181802</tns:poID>\n    </tns:existingOrganization>\n  </tns:summary4FundingSponsor>\n  <tns:programCode>PG00001</tns:programCode>\n  <tns:fundedByNciGrant>false</tns:fundedByNciGrant>\n  <tns:grant>\n    <tns:fundingMechanism>B09</tns:fundingMechanism>\n    <tns:nihInstitutionCode>AA</tns:nihInstitutionCode>\n    <tns:serialNumber>111111</tns:serialNumber>\n    <tns:nciDivisionProgramCode>CCR</tns:nciDivisionProgramCode>\n    <tns:fundingPercentage>100.0</tns:fundingPercentage>\n  </tns:grant>\n  <tns:trialStatus>In Review</tns:trialStatus>\n  <tns:whyStopped></tns:whyStopped>\n  <tns:trialStatusDate>2014-07-15</tns:trialStatusDate>\n  <tns:trialStartDate type=\"Actual\">2014-07-15</tns:trialStartDate>\n  <tns:primaryCompletionDate type=\"Anticipated\">2019-07-15</tns:primaryCompletionDate>\n  <tns:completionDate type=\"Anticipated\">2019-07-15</tns:completionDate>\n  <tns:ind>\n    <tns:number>111111</tns:number>\n    <tns:grantor>CDER</tns:grantor>\n    <tns:holderType>NIH</tns:holderType>\n    <tns:nihInstitution>NEI</tns:nihInstitution>\n    <tns:expandedAccess>true</tns:expandedAccess>\n    <tns:expandedAccessType>Available</tns:expandedAccessType>\n    <tns:exempt>true</tns:exempt>\n  </tns:ind>\n  <tns:ide>\n    <tns:number>222222</tns:number>\n    <tns:grantor>CDRH</tns:grantor>\n    <tns:holderType>NCI</tns:holderType>\n    <tns:nciDivisionProgramCode>CCR</tns:nciDivisionProgramCode>\n    <tns:expandedAccess>true</tns:expandedAccess>\n    <tns:expandedAccessType>Available</tns:expandedAccessType>\n    <tns:exempt>true</tns:exempt>\n  </tns:ide>\n  <tns:regulatoryInformation>\n    <tns:country>USA</tns:country>\n    <tns:authorityName>Federal Government</tns:authorityName>\n    <tns:fdaRegulated>true</tns:fdaRegulated>\n    <tns:section801>true</tns:section801>\n    <tns:delayedPosting>true</tns:delayedPosting>\n    <tns:dataMonitoringCommitteeAppointed>true</tns:dataMonitoringCommitteeAppointed>\n  </tns:regulatoryInformation>\n  <tns:protocolDocument filename=\"protocol.pdf\">dGVzdA==</tns:protocolDocument>\n  <tns:irbApprovalDocument filename=\"irb.pdf\">dGVzdA==</tns:irbApprovalDocument>\n  <tns:participatingSitesDocument\n          filename=\"sites.pdf\">dGVzdA==</tns:participatingSitesDocument>\n  <tns:informedConsentDocument filename=\"consent.pdf\">dGVzdA==</tns:informedConsentDocument>\n  <tns:otherDocument filename=\"other.pdf\">dGVzdA==</tns:otherDocument>\n  <tns:category>Externally Peer-Reviewed</tns:category>\n  <tns:trialOwner>qatest@nih.gov</tns:trialOwner>\n</tns:CompleteTrialRegistration>\n','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<TrialRegistrationConfirmation xmlns=\"gov.nih.nci.pa.webservices.types\" xmlns:ns2=\"gov.nih.nci.po.webservices.types.trimmed\">\n    <paTrialID>1618195</paTrialID>\n    <nciTrialID>NCI-2018-03030</nciTrialID>\n</TrialRegistrationConfirmation>\n','200','6255','');
#      "
#      puts sql_insert_webservice_access_log
# end
#
# # insert_webservice_access_log 'ST20182602A'
#
#
# #16
# def insert_study_contact(seedTrialID)
#      @seed_json_data = read_json_from_dir(@converted_json_dir, @dt4_formula_json)
#      @seed_data = @seed_json_data.find {|x| x['seedTrialID'] == "#{seedTrialID}"}
#      puts @seed_data
# sql_insert_study_contact =
#     "
#       INSERT INTO study_contact (identifier,role_code,primary_indicator,address_line,delivery_address_line,city,state,postal_code,country_identifier,telephone,email,healthcare_provider_identifier,clinical_research_staff_identifier,study_protocol_identifier,status_code,status_date_range_low,date_last_created,date_last_updated,status_date_range_high,organizational_contact_identifier,user_last_created_id,user_last_updated_id,title,prs_user_name,comments) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+78}','STUDY_PRINCIPAL_INVESTIGATOR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'129817','129811','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','PENDING','2018-02-21 08:34:57.943','2018-02-21 08:34:57.942','2018-02-21 08:34:57.942',NULL,NULL,'14','14',NULL,NULL,NULL);
#       INSERT INTO study_contact (identifier,role_code,primary_indicator,address_line,delivery_address_line,city,state,postal_code,country_identifier,telephone,email,healthcare_provider_identifier,clinical_research_staff_identifier,study_protocol_identifier,status_code,status_date_range_low,date_last_created,date_last_updated,status_date_range_high,organizational_contact_identifier,user_last_created_id,user_last_updated_id,title,prs_user_name,comments) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+97}','RESPONSIBLE_PARTY_SPONSOR_INVESTIGATOR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'129811','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','PENDING','2018-02-21 08:34:58.211','2018-02-21 08:34:58.211','2018-02-21 08:34:58.211',NULL,NULL,'14','14','CEO & Chairman',NULL,NULL);
#      "
#      puts sql_insert_study_contact
# end
#
# # insert_study_contact 'ST20182602A'
#
# #17
# def insert_arm(seedTrialID)
#      @seed_json_data = read_json_from_dir(@converted_json_dir, @dt4_formula_json)
#      @seed_data = @seed_json_data.find {|x| x['seedTrialID'] == "#{seedTrialID}"}
#      puts @seed_data
# sql_insert_arm =
#     "
#       INSERT INTO arm (identifier,study_protocol_identifier,name,type_code,description_text,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i-1320}','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','Arm1','EXPERIMENTAL','Arm description','2018-02-21 13:37:24.422969','2018-02-21 13:37:24.422969','14','14');
#       INSERT INTO arm (identifier,study_protocol_identifier,name,type_code,description_text,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i-1319}','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','Arm1','EXPERIMENTAL','Arm description','2018-02-21 13:38:46.80249','2018-02-21 13:38:46.80249','14','14');
#      "
#      puts sql_insert_arm
# end
#
# # insert_arm 'ST20182602A'
#
#
# #18 -- no need to insert following query
# def insert_auditlogrecord(seedTrialID)
#      @seed_json_data = read_json_from_dir(@converted_json_dir, @dt4_formula_json)
#      @seed_data = @seed_json_data.find {|x| x['seedTrialID'] == "#{seedTrialID}"}
#      puts @seed_data
# sql_insert_auditlogrecord =
#     "
#       INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618196','ctrpsubstractor','STUDY_PROTOCOL','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','2018-02-21 08:34:56.542','60385','INSERT');
#       INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618225','ctrpsubstractor','DOCUMENT_WORKFLOW_STATUS','1618224','2018-02-21 08:34:56.888','60386','INSERT');
#       INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618233','ctrpsubstractor','STUDY_OVERALL_STATUS','1618231','2018-02-21 08:34:56.964','60387','INSERT');
#       INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618240','ctrpsubstractor','STUDY_RECRUITMENT_STATUS','1618232','2018-02-21 08:34:56.966','60387','INSERT');
#       INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618245','ctrpsubstractor','STUDY_INDLDE','1618244','2018-02-21 08:34:57.053','60388','INSERT');
#       INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618260','ctrpsubstractor','STUDY_RESOURCING','1618258','2018-02-21 08:34:57.129','60389','INSERT');
#       INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618271','ctrpsubstractor','STUDY_INDLDE','1618257','2018-02-21 08:34:57.092','60389','INSERT');
#       INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618283','ctrpsubstractor','STUDY_RESOURCING','1618259','2018-02-21 08:34:57.278','60389','INSERT');
#       INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618292','ctrpsubstractor','STUDY_SITE','1618291','2018-02-21 08:34:57.604','60390','INSERT');
#       INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618302','ctrpsubstractor','STUDY_CONTACT','1618301','2018-02-21 08:34:57.944','60391','INSERT');
#       INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618312','ctrpsubstractor','STUDY_SITE','1618311','2018-02-21 08:34:58.065','60392','INSERT');
#       INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618321','ctrpsubstractor','STUDY_CONTACT','1618320','2018-02-21 08:34:58.212','60393','INSERT');
#       INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618331','ctrpsubstractor','STUDY_SITE','1618330','2018-02-21 08:34:58.298','60394','INSERT');
#       INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618341','ctrpsubstractor','STUDY_SITE','1618340','2018-02-21 08:34:58.531','60395','INSERT');
#       INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618354','ctrpsubstractor','DOCUMENT','1618351','2018-02-21 08:34:58.797','60396','INSERT');
#       INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618363','ctrpsubstractor','DOCUMENT','1618351','2018-02-21 08:34:59.042','60396','UPDATE');
#       INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618368','ctrpsubstractor','DOCUMENT','1618350','2018-02-21 08:34:59.042','60396','UPDATE');
#       INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618373','ctrpsubstractor','STUDY_PROTOCOL','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','2018-02-21 08:34:59.043','60396','UPDATE');
#       INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618375','ctrpsubstractor','DOCUMENT','1618349','2018-02-21 08:34:58.711','60396','INSERT');
#       INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618384','ctrpsubstractor','DOCUMENT','1618352','2018-02-21 08:34:59.042','60396','UPDATE');
#       INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618389','ctrpsubstractor','DOCUMENT','1618349','2018-02-21 08:34:59.04','60396','UPDATE');
#       INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618394','ctrpsubstractor','DOCUMENT','1618353','2018-02-21 08:34:58.858','60396','INSERT');
#       INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618403','ctrpsubstractor','DOCUMENT','1618353','2018-02-21 08:34:59.042','60396','UPDATE');
#       INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618408','ctrpsubstractor','DOCUMENT','1618352','2018-02-21 08:34:58.831','60396','INSERT');
#       INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618417','ctrpsubstractor','DOCUMENT','1618350','2018-02-21 08:34:58.765','60396','INSERT');
#      "
#      puts sql_insert_auditlogrecord
# end
#
# # insert_auditlogrecord 'ST20182602A'
#
# #19
# def insert_planned_eligibility_criterion(seedTrialID)
#      @seed_json_data = read_json_from_dir(@converted_json_dir, @dt4_formula_json)
#      @seed_data = @seed_json_data.find {|x| x['seedTrialID'] == "#{seedTrialID}"}
#      puts @seed_data
# sql_insert_planned_eligibility_criterion =
#     "
#       INSERT INTO planned_eligibility_criterion (identifier,inclusion_indicator,criterion_name,operator,eligible_gender_code,min_value,min_unit,max_value,max_unit,unit,display_order,structured_indicator,text_value,cde_public_identifier,cde_version_number) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i-165}','t','AGE',NULL,NULL,'12.0','Years','80.0','Years',NULL,NULL,NULL,NULL,NULL,NULL);
#       INSERT INTO planned_eligibility_criterion (identifier,inclusion_indicator,criterion_name,operator,eligible_gender_code,min_value,min_unit,max_value,max_unit,unit,display_order,structured_indicator,text_value,cde_public_identifier,cde_version_number) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i-164}','t','GENDER',NULL,'MALE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
#       INSERT INTO planned_eligibility_criterion (identifier,inclusion_indicator,criterion_name,operator,eligible_gender_code,min_value,min_unit,max_value,max_unit,unit,display_order,structured_indicator,text_value,cde_public_identifier,cde_version_number) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i-163}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','f',NULL,NULL,NULL);
#       INSERT INTO planned_eligibility_criterion (identifier,inclusion_indicator,criterion_name,operator,eligible_gender_code,min_value,min_unit,max_value,max_unit,unit,display_order,structured_indicator,text_value,cde_public_identifier,cde_version_number) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i-161}','t','AGE',NULL,NULL,'12.0','Years','80.0','Years',NULL,NULL,NULL,NULL,NULL,NULL);
#      "
# puts sql_insert_planned_eligibility_criterion
# end
#
# # insert_planned_eligibility_criterion 'ST20182602A'
#
# #20
# def insert_document(seedTrialID)
#      @seed_json_data = read_json_from_dir(@converted_json_dir, @dt4_formula_json)
#      @seed_data = @seed_json_data.find {|x| x['seedTrialID'] == "#{seedTrialID}"}
#      puts @seed_data
# sql_insert_document =
#     "
#       INSERT INTO document (identifier,type_code,active_indicator,file_name,study_protocol_identifier,inactive_comment_text,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,original,deleted,study_inbox_id,ctro_user_date_created,ccct_user_date_created,ctro_user_id,ccct_user_name) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+126}','PROTOCOL_DOCUMENT','t','protocol.pdf','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}',NULL,'2018-02-21 08:34:58.702','2018-02-21 08:34:58.877','14','14','t','f',NULL,NULL,NULL,NULL,NULL);
#       INSERT INTO document (identifier,type_code,active_indicator,file_name,study_protocol_identifier,inactive_comment_text,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,original,deleted,study_inbox_id,ctro_user_date_created,ccct_user_date_created,ctro_user_id,ccct_user_name) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+127}','IRB_APPROVAL_DOCUMENT','t','irb.pdf','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}',NULL,'2018-02-21 08:34:58.756','2018-02-21 08:34:58.908','14','14','t','f',NULL,NULL,NULL,NULL,NULL);
#       INSERT INTO document (identifier,type_code,active_indicator,file_name,study_protocol_identifier,inactive_comment_text,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,original,deleted,study_inbox_id,ctro_user_date_created,ccct_user_date_created,ctro_user_id,ccct_user_name) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+128}','PARTICIPATING_SITES','t','sites.pdf','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}',NULL,'2018-02-21 08:34:58.788','2018-02-21 08:34:58.941','14','14','t','f',NULL,NULL,NULL,NULL,NULL);
#       INSERT INTO document (identifier,type_code,active_indicator,file_name,study_protocol_identifier,inactive_comment_text,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,original,deleted,study_inbox_id,ctro_user_date_created,ccct_user_date_created,ctro_user_id,ccct_user_name) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+129}','INFORMED_CONSENT_DOCUMENT','t','consent.pdf','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}',NULL,'2018-02-21 08:34:58.823','2018-02-21 08:34:58.972','14','14','t','f',NULL,NULL,NULL,NULL,NULL);
#       INSERT INTO document (identifier,type_code,active_indicator,file_name,study_protocol_identifier,inactive_comment_text,date_last_created,date_last_updated,user_last_created_id,user_last_updated_id,original,deleted,study_inbox_id,ctro_user_date_created,ccct_user_date_created,ctro_user_id,ccct_user_name) VALUES ('#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i+130}','OTHER','t','other.pdf','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}',NULL,'2018-02-21 08:34:58.851','2018-02-21 08:34:59.001','14','14','t','f',NULL,NULL,NULL,NULL,NULL);
#      "
#      puts sql_insert_document
# end
#
# # insert_document 'ST20182602A'
#
# #21
# def insert_arm_intervention(seedTrialID)
#      @seed_json_data = read_json_from_dir(@converted_json_dir, @dt4_formula_json)
#      @seed_data = @seed_json_data.find {|x| x['seedTrialID'] == "#{seedTrialID}"}
#      puts @seed_data
# sql_insert_arm_intervention =
#     "
#       INSERT INTO arm_intervention (identifier,arm_identifier,planned_activity_identifier) VALUES ('117','#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i-1320}','#{@seed_data['study_milestone_identifier'].gsub("'", "").to_i-162}');
#     "
#      puts sql_insert_arm_intervention
# end
#
# # insert_arm_intervention 'ST20182602A'