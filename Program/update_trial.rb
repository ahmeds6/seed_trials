require '../Program/tools/pg_helper'
require '../Program/env'

def update_trial_by_protocol_id(protocol_identifier)
  #1
  # insert_﻿study_milestone protocol_identifier
  #2
  # insert_document_workflow_status protocol_identifier
  #3
  # update_nci_specific protocol_identifier
  #4
  # update_human_subject protocol_identifier
  #5
  # update_﻿trial_description protocol_identifier
  #6
  # update_design_detail protocol_identifier
  #7
  # insert_outcome_measures protocol_identifier
  #8
  # update_﻿eligibilty_criteria protocol_identifier
  #9
  # insert_eligibilty_criteria_age protocol_identifier
  #10
  # insert_eligibilty_criteria_age_eli protocol_identifier
  #11
  # insert_eligibilty_criteria_gender protocol_identifier
  #12
  # insert_eligibilty_criteria_gender_eli protocol_identifier
  # 13
  # insert_eligibilty_criteria_other protocol_identifier
  #14
  # insert_eligibilty_criteria_other_eli protocol_identifier
  #15
  insert_interventions protocol_identifier
  #16
  insert_study_disease protocol_identifier





end

# Run following to accept a trial
# 1
def insert_﻿study_milestone(protocol_identifier)
  _tab = 'public.study_milestone'
  _col = ['identifier', 'milestone_code', 'milestone_date', 'study_protocol_identifier', 'date_last_created', 'date_last_updated', 'user_last_created_id', 'user_last_updated_id']
  _val = ["(select max(identifier) + 1 from study_milestone)", "'SUBMISSION_ACCEPTED'", 'current_timestamp', protocol_identifier, 'current_timestamp', 'current_timestamp', '14', '14']
  PgHelper.new('PA').insert_value(_tab, _col, _val)
end

#2
def insert_document_workflow_status(protocol_identifier)
  _tab = 'public.document_workflow_status'
  _col = ['identifier', 'status_code', 'status_date_range_low', 'study_protocol_identifier', 'date_last_created', 'date_last_updated', 'user_last_created_id', 'user_last_updated_id']
  _val = ["(select max(identifier) + 1 from document_workflow_status)", "'ACCEPTED'", 'current_timestamp', protocol_identifier, 'current_timestamp', 'current_timestamp', '14', '14']
  PgHelper.new('PA').insert_value(_tab, _col, _val)
end

#3
def update_nci_specific(protocol_identifier)
  table_nm = 'study_protocol'
  values = {accr_rept_meth_code: 'COMPLETE'}
  criteria = {identifier: protocol_identifier}
  PgHelper.new('PA').set_value(table_nm, values, criteria)
end

#4
def update_human_subject(protocol_identifier)
  table_nm = 'study_protocol'
  values = {review_brd_approval_req_indicator: false}
  criteria = {identifier: protocol_identifier}
  PgHelper.new('PA').set_value(table_nm, values, criteria)
end

#5
def update_﻿trial_description(protocol_identifier)
  @random_number = rand 1..99999999
  pb_ttle = "Test seed data for Brief Title #{@random_number}"
  pb_desc = "Test data through DB insert for Brief Summary. "
  table_nm = 'study_protocol'
  values = {public_tittle: protocol_identifier + pb_ttle, public_description: protocol_identifier + pb_desc + pb_desc}
  criteria = {identifier: protocol_identifier}
  PgHelper.new('PA').set_value(table_nm, values, criteria)
end

#6
def update_design_detail(protocol_identifier)
  ﻿design_configuration_code_val = "SINGLE_GROUP"
  number_of_intervention_groups_val = "1"
  blinding_role_code_subject_val = "SUBJECT"
  allocation_code_val = "NA"
  min_target_accrual_num_val = "1"
  table_nm = 'study_protocol'
  values = {design_configuration_code: ﻿design_configuration_code_val, number_of_intervention_groups: number_of_intervention_groups_val, blinding_role_code_subject: blinding_role_code_subject_val, allocation_code: allocation_code_val, min_target_accrual_num: min_target_accrual_num_val}
  criteria = {identifier: protocol_identifier}
  PgHelper.new('PA').set_value(table_nm, values, criteria)
end

#7
def insert_outcome_measures(protocol_identifier)
  _tab = 'public.study_outcome_measure'
  _col = ['identifier', 'name', 'timeframe', 'study_protocol_identifier', 'date_last_created', 'date_last_updated', 'user_last_created_id', 'user_last_updated_id', 'type_code']
  _val = ["(select max(identifier) + 1 from study_outcome_measure)", "'measure 1'", "'measure timeframe 1'", protocol_identifier, 'current_timestamp', 'current_timestamp', '14', '14', "'PRIMARY'"]
  PgHelper.new('PA').insert_value(_tab, _col, _val)
end

#8
def update_﻿eligibilty_criteria(protocol_identifier)
  table_nm = 'study_protocol'
  values = {accept_healthy_volunteers_indicator: true}
  criteria = {identifier: protocol_identifier}
  PgHelper.new('PA').set_value(table_nm, values, criteria)
end

#9
def insert_eligibilty_criteria_age(protocol_identifier)
  _tab = 'public.planned_activity'
  _col = ['identifier', 'category_code', 'study_protocol_identifier', 'date_last_updated']
  _val = ["(select max(identifier) + 1 from planned_activity)", "'ELIGIBILITY_CRITERION'", protocol_identifier, 'current_timestamp']
  PgHelper.new('PA').insert_value(_tab, _col, _val)
end

#10
def insert_eligibilty_criteria_age_eli(protocol_identifier)
  _tab = 'public.planned_eligibility_criterion'
  _col = ['identifier', 'inclusion_indicator', 'criterion_name', 'min_value', 'min_unit', 'max_value', 'max_unit']
  _val = ["(select max(identifier) from planned_activity)", 'true', "'AGE'", "'12.0'", "'Years'", "'80.0'", "'Years'"]
  PgHelper.new('PA').insert_value(_tab, _col, _val)
end

#11
def insert_eligibilty_criteria_gender(protocol_identifier)
  _tab = 'public.planned_activity'
  _col = ['identifier', 'category_code', 'study_protocol_identifier', 'date_last_updated']
  _val = ["(select max(identifier) + 1 from planned_activity)", "'ELIGIBILITY_CRITERION'", protocol_identifier, 'current_timestamp']
  PgHelper.new('PA').insert_value(_tab, _col, _val)
end

#12
def insert_eligibilty_criteria_gender_eli(protocol_identifier)
  _tab = 'public.planned_eligibility_criterion'
  _col = ['identifier', 'inclusion_indicator', 'criterion_name', 'eligible_gender_code']
  _val = ["(select max(identifier) from planned_activity)", 'true', "'GENDER'", "'MALE'"]
  PgHelper.new('PA').insert_value(_tab, _col, _val)
end

#13
def insert_eligibilty_criteria_other(protocol_identifier)
  _tab = 'public.planned_activity'
  _col = ['identifier', 'category_code', 'text_description', 'study_protocol_identifier', 'date_last_updated', 'display_order']
  _val = ["(select max(identifier) + 1 from planned_activity)", "'OTHER'", "'test'", protocol_identifier, 'current_timestamp', '1']
  PgHelper.new('PA').insert_value(_tab, _col, _val)
end

#14
def insert_eligibilty_criteria_other_eli(protocol_identifier)
  _tab = 'public.planned_eligibility_criterion'
  _col = ['identifier', 'display_order', 'structured_indicator']
  _val = ["(select max(identifier) from planned_activity)", '1', 'false']
  PgHelper.new('PA').insert_value(_tab, _col, _val)
end

#15
def insert_interventions(protocol_identifier)
  _tab = 'public.planned_activity'
  _col = ['identifier', 'category_code', 'subcategory_code', 'lead_product_indicator', 'study_protocol_identifier', 'intervention_identifier', 'date_last_created', 'date_last_updated', 'user_last_created_id', 'user_last_updated_id']
  _val = ["(select max(identifier) + 1 from planned_activity)", "'SUBSTANCE_ADMINISTRATION'", "'Drug'", 'false', protocol_identifier, "(SELECT identifier from intervention where name = 'Liver Transplantation' and type_code = 'PROCEDURE_SURGERY')", 'current_timestamp', 'current_timestamp', '14', '14']
  PgHelper.new('PA').insert_value(_tab, _col, _val)
end

#16
def insert_study_disease(protocol_identifier)
  _tab = 'public.study_disease'
  _col = ['identifier', 'study_protocol_identifier', 'disease_identifier', 'date_last_created', 'date_last_updated', 'ctgovxml_indicator', 'user_last_created_id', 'user_last_updated_id']
  _val = ["(select max(identifier) + 1 from study_disease)", protocol_identifier, "(SELECT identifier from pdq_disease where preferred_name = 'Hematopoietic and Lymphoid System Neoplasm')", 'current_timestamp', 'current_timestamp', 'true', '14', '14']
  PgHelper.new('PA').insert_value(_tab, _col, _val)
end

#17







update_trial_by_protocol_id '1618202'











