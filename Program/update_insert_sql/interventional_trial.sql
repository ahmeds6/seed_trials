select * 
from study_protocol
where nci_id = 'NCI-2018-03043'
and nct_id = 'NCT91914266'
and lead_org_id='UPCC 348-02 II - sa1'
and identifier = '1670547'
and official_title= 'A Phase I/II Study Of Brentuximab Vedotin In Combination With Multi-Agent Chemotherapy II'
and phase_code = 'I'
and pri_compl_date = '2019-07-15 00:00:00'
and pri_compl_date_type_code = 'ANTICIPATED'
and start_date='2014-07-15 00:00:00'
and start_date_type_code = 'ACTUAL'
and primary_purpose_code = 'OTHER'
and primary_purpose_other_text = 'Determine maximum tolerated dose (MTD) of brentuximab vedotin'
and study_protocol_type='InterventionalStudyProtocol'
and date_last_created='2018-02-12 12:00:33.814'
and status_code='ACTIVE'
and status_date = '2018-02-12 12:00:33.807'
and program_code_text is null /*initial value is PG00001 once accept the trial system clear this field to null*/
and user_last_created_id = '14'
and completion_date = '2019-07-15 00:00:00'
and completion_date_type_code = 'ANTICIPATED'
and accrual_disease_code_system='ICD10'
and submitting_organization_id = '693442'






SET v.sp_id = 1670547;
select current_setting('v.sp_id');

/*Milestone*/
Select study_protocol_identifier, 
	   milestone_code, 
	   milestone_date, 
	   date_last_created, 
	   date_last_updated, 
	   user_last_created_id, 
	   user_last_updated_id 
  from study_milestone
 where study_protocol_identifier = 1670547;

   
/*Run following to accept a trial*/ 
INSERT INTO study_milestone (identifier, milestone_code, milestone_date, study_protocol_identifier, date_last_created, date_last_updated, user_last_created_id, user_last_updated_id) 
              VALUES ((select max(identifier) + 1 from study_milestone), "'SUBMISSION_ACCEPTED'", current_timestamp, '1670547', current_timestamp, current_timestamp, '14', '14');


INSERT INTO document_workflow_status (identifier, status_code, status_date_range_low, study_protocol_identifier, date_last_created, date_last_updated, user_last_created_id, user_last_updated_id) 
                              VALUES ((select max(identifier) + 1 from document_workflow_status), "'ACCEPTED'", current_timestamp, '1670547', current_timestamp, current_timestamp, '14', '14');

/*NCI Specific Information*/       
/* need to update the study_protocol table for "Reporting Data Set Method status" as "COMPLETE"*/ 

Select accr_rept_meth_code from study_protocol where identifier = '1670547';

UPDATE study_protocol 
SET accr_rept_meth_code='COMPLETE'
WHERE identifier = '1670547';

/*Human Subject Safety Information*/       
/* need to update the study_protocol table for "Board Approval Status" as "Submission not required"*/ 

Select review_brd_approval_req_indicator from study_protocol where identifier = '1670547';

UPDATE study_protocol 
SET review_brd_approval_req_indicator = false
WHERE identifier = '1670547';

/*Trial Description*/       
/* need to update the study_protocol table for "Brief Title" as "Title: Test data through DB insert for Brief Title. Test data through DB insert for Brief Title"*/ 
/* need to update the study_protocol table for "Summary: Test data through DB insert for Brief Summary. Test data through DB insert for Brief Summary.Test data through DB insert for Brief Summary. Test data through DB insert for Brief Summary."*/ 

Select public_tittle, public_description from study_protocol where identifier = '1670547';

UPDATE study_protocol 
SET public_tittle = 'Test seed data for Brief Title',
    public_description = 'Test data through DB insert for Brief Summary. Test data through DB insert for Brief Summary.Test data through DB insert for Brief Summary. Test data through DB insert for Brief Summary.'
WHERE identifier = '1670547';

/*Design Detail*/       
/* need to update the study_protocol table for "Interventional Study Model" as "SINGLE_GROUP"*/ 
/* need to update the study_protocol table for "Number of Arms" as "1"*/ 
/* need to update the study_protocol table for "Masking" as "SUBJECT"*/ 
/* need to update the study_protocol table for "Allocation" as "NA"*/ 
/* need to update the study_protocol table for "Target Enrollment" as "1"*/ 

Select design_configuration_code,
       number_of_intervention_groups,
       blinding_role_code_subject, 
	   allocation_code, 
	   min_target_accrual_num
from study_protocol where identifier = '1670547';

UPDATE study_protocol 
SET design_configuration_code = 'SINGLE_GROUP',
    number_of_intervention_groups = '1',
	blinding_role_code_subject = 'SUBJECT',
	allocation_code = 'NA',
	min_target_accrual_num = '1'
WHERE identifier = '1670547';


/*Outcome Measures*/       
/* need to insert value in the study_outcome_measure table for "Outcome Measure Type" as "PRIMARY"*/ 
/* need to insert value in the study_outcome_measure table for "Title" as "measure 1"*/ 
/* need to insert value in the study_outcome_measure table for "Time Frame" as "measure timeframe 1" */ 

Select name,
       timeframe,
       type_code,
	   identifier,
	   date_last_created,
	   date_last_updated,
	   user_last_created_id,
	   user_last_updated_id
from study_outcome_measure where study_protocol_identifier = '1670547';

Select *
from study_outcome_measure where study_protocol_identifier = '1670547';

select max(identifier) + 1 from study_outcome_measure;

INSERT INTO study_outcome_measure 
           (identifier, name, timeframe, study_protocol_identifier, date_last_created, date_last_updated, user_last_created_id, user_last_updated_id, type_code) 
    VALUES ((select max(identifier) + 1 from study_outcome_measure), 'measure 1', 'measure timeframe 1', '1670547', current_timestamp, current_timestamp, '14', '14', 'PRIMARY');
	

/*Eligibilty criteria*/       
/* need to update the study_protocol table for "Accepts Healthy Volunteers?" as "true"*/ 

Select accept_healthy_volunteers_indicator
from study_protocol where identifier = '1670547';

UPDATE study_protocol 
SET accept_healthy_volunteers_indicator = true
WHERE identifier = '1670547';


/*Eligibilty criteria*/       
/* need to insert value in the planned_activity and planned_eligibility_criterion table(s) for "Minimum Age" as "12.0"*/ 
/* need to insert value in the planned_activity and planned_eligibility_criterion table(s) for "Minimum Age Unit" as "Years"*/ 
/* need to insert value in the planned_activity and planned_eligibility_criterion table(s) for "Maxmimum Age" as "80.0" */ 
/* need to insert value in the planned_activity and planned_eligibility_criterion table(s) for "Maxmimum Age Unit" as "Years"*/ 
/* need to insert value in the planned_activity and planned_eligibility_criterion table(s) for "Gender" as "MALE"*/ 
/* need to insert value in the planned_activity and planned_eligibility_criterion table(s) for "Other" as "test" */ 

/*==========================================*/
/* Adding Eligibility criteria - Age */
/* ----planned_activity table */

Select identifier, category_code, study_protocol_identifier, date_last_updated
  from planned_activity 
 where study_protocol_identifier = '1670547';
  
select max(identifier) + 1 from planned_activity;
  
INSERT INTO planned_activity 
           (identifier, category_code, study_protocol_identifier, date_last_updated) 
    VALUES ((select max(identifier) + 1 from planned_activity), 'ELIGIBILITY_CRITERION', '1670547', current_timestamp);
	
/* ---planned_eligibility_criterion table */ 
Select *
from planned_eligibility_criterion; 
  
Select identifier, inclusion_indicator, criterion_name, min_value, min_unit, max_value, max_unit
  from planned_eligibility_criterion
  where identifier in (select max(identifier) from planned_activity);
  
INSERT INTO planned_eligibility_criterion 
           (identifier, inclusion_indicator, criterion_name, min_value, min_unit, max_value, max_unit) 
    VALUES ((select max(identifier) from planned_activity), true, 'AGE', '12.0', 'Years', '80.0', 'Years');
/*##########################################*/

/*==========================================*/
/* Adding Eligibility criteria - Gender */
/* ----planned_activity table */

 
INSERT INTO planned_activity 
           (identifier, category_code, study_protocol_identifier, date_last_updated) 
    VALUES ((select max(identifier) + 1 from planned_activity), 'ELIGIBILITY_CRITERION', '1670547', current_timestamp);
  

/* planned_eligibility_criterion table */ 
/* ---need better query */
  
INSERT INTO planned_eligibility_criterion 
           (identifier, inclusion_indicator, criterion_name, eligible_gender_code) 
    VALUES ((select max(identifier) from planned_activity), true, 'GENDER', 'MALE');
/*##########################################*/

/*==========================================*/
/* Adding Eligibility criteria - Other */
/* ---planned_activity table */

 
INSERT INTO planned_activity 
           (identifier, category_code, text_description, study_protocol_identifier, date_last_updated, display_order) 
    VALUES ((select max(identifier) + 1 from planned_activity), 'OTHER', 'test', '1670547', current_timestamp, '1');
  

/* -----planned_eligibility_criterion table */ 
  
INSERT INTO planned_eligibility_criterion 
           (identifier, display_order, structured_indicator) 
    VALUES ((select max(identifier) from planned_activity), '1', false);
	
/*##########################################*/
/*==========================================*/


/*##########################################*/
/* Interventions */       
/* need to insert value in the planned_activity table for "Intervention Type" as "PROCEDURE_SURGERY"*/ 
/* need to insert value in the planned_activity table for "Intervention Name" as "Liver Transplantation"*/ 

/* get the intervention id first */
/*  values = {name: Liver Transplantation, type_code: PROCEDURE_SURGERY} */
select identifier, category_code, subcategory_code, lead_product_indicator, study_protocol_identifier, intervention_identifier, date_last_created, date_last_updated, user_last_created_id, user_last_updated_id 
from planned_activity
where identifier in (select max(identifier) from planned_activity);

SELECT identifier from intervention where name = 'Liver Transplantation' and type_code = 'PROCEDURE_SURGERY';

/*insert*/
INSERT INTO planned_activity 
           (identifier, category_code, subcategory_code, lead_product_indicator, study_protocol_identifier, intervention_identifier, date_last_created, date_last_updated, user_last_created_id, user_last_updated_id) 
    VALUES ((select max(identifier) + 1 from planned_activity), 'SUBSTANCE_ADMINISTRATION', 'Drug', false, '1670547', (SELECT identifier from intervention where name = 'Liver Transplantation' and type_code = 'PROCEDURE_SURGERY'), current_timestamp, current_timestamp, '14', '14');


/*get @pa_intervention_id*/
SELECT identifier 
from planned_activity 
where category_code = 'SUBSTANCE_ADMINISTRATION'
  and study_protocol_identifier = 1670547
  and intervention_identifier in 
      (
      SELECT identifier 
		from intervention 
	   where name = 'Liver Transplantation' 
		 and type_code = 'PROCEDURE_SURGERY'
	  );


/*##########################################*/
/* Disease/Condition */       
/* need to insert value in the study_disease table for "Disease Preferred Name" as "Hematopoietic and Lymphoid System Neoplasm"*/ 

SELECT identifier from pdq_disease where preferred_name = 'Hematopoietic and Lymphoid System Neoplasm';

select identifier, study_protocol_identifier, disease_identifier, date_last_created, date_last_updated, ctgovxml_indicator, user_last_created_id, user_last_updated_id
from study_disease
where study_protocol_identifier = '1670547';

/*insert*/
INSERT INTO study_disease 
           (identifier, study_protocol_identifier, disease_identifier, date_last_created, date_last_updated, ctgovxml_indicator, user_last_created_id, user_last_updated_id) 
    VALUES ((select max(identifier) + 1 from study_disease), '1670547', (SELECT identifier from pdq_disease where preferred_name = 'Hematopoietic and Lymphoid System Neoplasm'), current_timestamp, current_timestamp, true, '14', '14');



/*##########################################*/
/* Arm */       
/* need to insert value in the arm table for "Label" as "Arm1"*/
/* need to insert value in the arm table for "Type" as "EXPERIMENTAL"*/
/* need to insert value in the arm table for "Description" as "Arm description"*/


/*insert*/
INSERT INTO arm 
           (identifier, study_protocol_identifier, name, type_code, description_text, date_last_created, date_last_updated, user_last_created_id, user_last_updated_id) 
    VALUES ((select max(identifier) + 1 from arm), '1670547', 'Arm1', 'EXPERIMENTAL', 'Arm description', current_timestamp, current_timestamp, '14', '14');

/*get @arm_id*/
SELECT identifier 
from arm 
where name = 'Arm1'
  and study_protocol_identifier = '1670547';


/*##########################################*/
/* associate Arm */       
/* need to insert value in the arm_intervention table to associate Arm (Arm1) and Intervention*/

/*get @arm_id*/
SELECT identifier from arm where name = 'Arm1' and study_protocol_identifier = '1670547';

/*get @pa_intervention_id*/
SELECT identifier from planned_activity where category_code = 'SUBSTANCE_ADMINISTRATION' and study_protocol_identifier = '1670547' and intervention_identifier in (SELECT identifier from intervention where name = 'Liver Transplantation' and type_code = 'PROCEDURE_SURGERY');


Select identifier, arm_identifier, planned_activity_identifier from arm_intervention
where arm_identifier in (SELECT identifier from arm where name = 'Arm1' and study_protocol_identifier = '1670547')
  and planned_activity_identifier in (SELECT identifier from planned_activity where category_code = 'SUBSTANCE_ADMINISTRATION' and study_protocol_identifier = '1670547' and intervention_identifier in (SELECT identifier from intervention where name = 'Liver Transplantation' and type_code = 'PROCEDURE_SURGERY'));

/*insert*/
INSERT INTO arm_intervention 
           (identifier, arm_identifier, planned_activity_identifier) 
		/*nextval('arm_intervention_identifier_seq'), (arm_id), (pa_intervention_id)*/
    VALUES (nextval('arm_intervention_identifier_seq'), (SELECT identifier from arm where name = 'Arm1' and study_protocol_identifier = '1670547'), (SELECT identifier from planned_activity where category_code = 'SUBSTANCE_ADMINISTRATION' and study_protocol_identifier = '1670547' and intervention_identifier in (SELECT identifier from intervention where name = 'Liver Transplantation' and type_code = 'PROCEDURE_SURGERY')));


/*##########################################*/
/* Trial Milestones */       
/* need to insert value in the study_milestone table for Trial Milestones "ADMINISTRATIVE_PROCESSING_START_DATE"-*/
/* need to insert value in the study_milestone table for Trial Milestones "ADMINISTRATIVE_PROCESSING_COMPLETED_DATE"-*/
/* need to insert value in the study_milestone table for Trial Milestones "ADMINISTRATIVE_READY_FOR_QC"-*/
/* need to insert value in the study_milestone table for Trial Milestones "ADMINISTRATIVE_QC_START"-*/
/* need to insert value in the study_milestone table for Trial Milestones "ADMINISTRATIVE_QC_COMPLETE"-*/
/* need to insert value in the study_milestone table for Trial Milestones "SCIENTIFIC_PROCESSING_START_DATE"-*/
/* need to insert value in the study_milestone table for Trial Milestones "SCIENTIFIC_PROCESSING_COMPLETED_DATE"-*/
/* need to insert value in the study_milestone table for Trial Milestones "SCIENTIFIC_READY_FOR_QC"-*/
/* need to insert value in the study_milestone table for Trial Milestones "SCIENTIFIC_QC_START"-*/
/* need to insert value in the study_milestone table for Trial Milestones "SCIENTIFIC_QC_COMPLETE"-*/
/* need to insert value in the study_milestone table for Trial Milestones "READY_FOR_TSR"=========-*/
/* need to insert value in the study_milestone table for Trial Milestones "TRIAL_SUMMARY_REPORT"========-*/
/* need to insert value in the study_milestone table for Trial Milestones "TRIAL_SUMMARY_FEEDBACK"-*/
/* need to insert value in the study_milestone table for Trial Milestones "INITIAL_ABSTRACTION_VERIFY"========-*/
/* need to insert value in the study_milestone table for Trial Milestones "ONGOING_ABSTRACTION_VERIFICATION"-*/

Select identifier, milestone_code, milestone_date, study_protocol_identifier, date_last_created, date_last_updated, user_last_created_id, user_last_updated_id
  from study_milestone
 where study_protocol_identifier = '1670547';

/*insert  -  ADMINISTRATIVE_PROCESSING_START_DATE */
INSERT INTO study_milestone 
           (identifier, milestone_code, milestone_date, study_protocol_identifier, date_last_created, date_last_updated, user_last_created_id, user_last_updated_id) 
    VALUES ((select max(identifier) + 1 from study_milestone), 'ADMINISTRATIVE_PROCESSING_START_DATE', current_timestamp, '1670547', current_timestamp, current_timestamp, '14', '14');

/*insert  -  ADMINISTRATIVE_PROCESSING_COMPLETED_DATE */
INSERT INTO study_milestone 
           (identifier, milestone_code, milestone_date, study_protocol_identifier, date_last_created, date_last_updated, user_last_created_id, user_last_updated_id) 
    VALUES ((select max(identifier) + 1 from study_milestone), 'ADMINISTRATIVE_PROCESSING_COMPLETED_DATE', current_timestamp, '1670547', current_timestamp, current_timestamp, '14', '14');

/*insert  -  ADMINISTRATIVE_READY_FOR_QC */
INSERT INTO study_milestone 
           (identifier, milestone_code, milestone_date, study_protocol_identifier, date_last_created, date_last_updated, user_last_created_id, user_last_updated_id) 
    VALUES ((select max(identifier) + 1 from study_milestone), 'ADMINISTRATIVE_READY_FOR_QC', current_timestamp, '1670547', current_timestamp, current_timestamp, '14', '14');

/*insert  -  ADMINISTRATIVE_QC_START */
INSERT INTO study_milestone 
           (identifier, milestone_code, milestone_date, study_protocol_identifier, date_last_created, date_last_updated, user_last_created_id, user_last_updated_id) 
    VALUES ((select max(identifier) + 1 from study_milestone), 'ADMINISTRATIVE_QC_START', current_timestamp, '1670547', current_timestamp, current_timestamp, '14', '14');

/*insert  -  ADMINISTRATIVE_QC_COMPLETE */
INSERT INTO study_milestone 
           (identifier, milestone_code, milestone_date, study_protocol_identifier, date_last_created, date_last_updated, user_last_created_id, user_last_updated_id) 
    VALUES ((select max(identifier) + 1 from study_milestone), 'ADMINISTRATIVE_QC_COMPLETE', current_timestamp, '1670547', current_timestamp, current_timestamp, '14', '14');


/*insert  -  SCIENTIFIC_PROCESSING_START_DATE */
INSERT INTO study_milestone 
           (identifier, milestone_code, milestone_date, study_protocol_identifier, date_last_created, date_last_updated, user_last_created_id, user_last_updated_id) 
    VALUES ((select max(identifier) + 1 from study_milestone), 'SCIENTIFIC_PROCESSING_START_DATE', current_timestamp, '1670547', current_timestamp, current_timestamp, '14', '14');


/*insert  -  SCIENTIFIC_PROCESSING_COMPLETED_DATE */
INSERT INTO study_milestone 
           (identifier, milestone_code, milestone_date, study_protocol_identifier, date_last_created, date_last_updated, user_last_created_id, user_last_updated_id) 
    VALUES ((select max(identifier) + 1 from study_milestone), 'SCIENTIFIC_PROCESSING_COMPLETED_DATE', current_timestamp, '1670547', current_timestamp, current_timestamp, '14', '14');


/*insert  -  SCIENTIFIC_READY_FOR_QC */
INSERT INTO study_milestone 
           (identifier, milestone_code, milestone_date, study_protocol_identifier, date_last_created, date_last_updated, user_last_created_id, user_last_updated_id) 
    VALUES ((select max(identifier) + 1 from study_milestone), 'SCIENTIFIC_READY_FOR_QC', current_timestamp, '1670547', current_timestamp, current_timestamp, '14', '14');


/*insert  -  SCIENTIFIC_QC_START */
INSERT INTO study_milestone 
           (identifier, milestone_code, milestone_date, study_protocol_identifier, date_last_created, date_last_updated, user_last_created_id, user_last_updated_id) 
    VALUES ((select max(identifier) + 1 from study_milestone), 'SCIENTIFIC_QC_START', current_timestamp, '1670547', current_timestamp, current_timestamp, '14', '14');


/*insert  - SCIENTIFIC_QC_COMPLETE  */
INSERT INTO study_milestone 
           (identifier, milestone_code, milestone_date, study_protocol_identifier, date_last_created, date_last_updated, user_last_created_id, user_last_updated_id) 
    VALUES ((select max(identifier) + 1 from study_milestone), 'SCIENTIFIC_QC_COMPLETE', current_timestamp, '1670547', current_timestamp, current_timestamp, '14', '14');


/*insert  -  READY_FOR_TSR */
INSERT INTO study_milestone 
           (identifier, milestone_code, milestone_date, study_protocol_identifier, date_last_created, date_last_updated, user_last_created_id, user_last_updated_id) 
    VALUES ((select max(identifier) + 1 from study_milestone), 'READY_FOR_TSR', current_timestamp, '1670547', current_timestamp, current_timestamp, '14', '14');

INSERT INTO document_workflow_status 
           (identifier, status_code, status_date_range_low, study_protocol_identifier, date_last_created, date_last_updated, user_last_created_id, user_last_updated_id) 
    VALUES ((select max(identifier) + 1 from document_workflow_status), 'ABSTRACTED', current_timestamp, '1670547', current_timestamp, current_timestamp, '14', '14');


/*insert  -  TRIAL_SUMMARY_REPORT */
INSERT INTO study_milestone 
           (identifier, milestone_code, milestone_date, study_protocol_identifier, date_last_created, date_last_updated, user_last_created_id, user_last_updated_id) 
    VALUES ((select max(identifier) + 1 from study_milestone), 'TRIAL_SUMMARY_REPORT', current_timestamp, '1670547', current_timestamp, current_timestamp, '14', '14');

INSERT INTO document_workflow_status 
           (identifier, status_code, status_date_range_low, study_protocol_identifier, date_last_created, date_last_updated, user_last_created_id, user_last_updated_id) 
    VALUES ((select max(identifier) + 1 from document_workflow_status), 'VERIFICATION_PENDING', current_timestamp, '1670547', current_timestamp, current_timestamp, '14', '14');


/*insert  -  TRIAL_SUMMARY_FEEDBACK */
INSERT INTO study_milestone 
           (identifier, milestone_code, milestone_date, study_protocol_identifier, date_last_created, date_last_updated, user_last_created_id, user_last_updated_id) 
    VALUES ((select max(identifier) + 1 from study_milestone), 'TRIAL_SUMMARY_FEEDBACK', current_timestamp, '1670547', current_timestamp, current_timestamp, '14', '14');


/*insert  -  INITIAL_ABSTRACTION_VERIFY */
INSERT INTO study_milestone 
           (identifier, milestone_code, milestone_date, study_protocol_identifier, date_last_created, date_last_updated, user_last_created_id, user_last_updated_id) 
    VALUES ((select max(identifier) + 1 from study_milestone), 'INITIAL_ABSTRACTION_VERIFY', current_timestamp, '1670547', current_timestamp, current_timestamp, '14', '14');

INSERT INTO document_workflow_status 
           (identifier, status_code, status_date_range_low, study_protocol_identifier, date_last_created, date_last_updated, user_last_created_id, user_last_updated_id) 
    VALUES ((select max(identifier) + 1 from document_workflow_status), 'ABSTRACTION_VERIFIED_RESPONSE', current_timestamp, '1670547', current_timestamp, current_timestamp, '14', '14');


/*insert  -  ONGOING_ABSTRACTION_VERIFICATION */
INSERT INTO study_milestone 
           (identifier, milestone_code, milestone_date, study_protocol_identifier, date_last_created, date_last_updated, user_last_created_id, user_last_updated_id) 
    VALUES ((select max(identifier) + 1 from study_milestone), 'ONGOING_ABSTRACTION_VERIFICATION', current_timestamp, '1670547', current_timestamp, current_timestamp, '14', '14');














