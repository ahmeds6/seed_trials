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

#18 -- no need to insert following query
def insert_auditlogrecord(seedTrialID)
     @seed_json_data = read_json_from_dir(@converted_json_dir, @dt4_formula_json)
     @seed_data = @seed_json_data.find {|x| x['seedTrialID'] == "#{seedTrialID}"}
     puts @seed_data
sql_insert_auditlogrecord =
    "
      INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618196','ctrpsubstractor','STUDY_PROTOCOL','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','2018-02-21 08:34:56.542','60385','INSERT');
      INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618225','ctrpsubstractor','DOCUMENT_WORKFLOW_STATUS','1618224','2018-02-21 08:34:56.888','60386','INSERT');
      INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618233','ctrpsubstractor','STUDY_OVERALL_STATUS','1618231','2018-02-21 08:34:56.964','60387','INSERT');
      INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618240','ctrpsubstractor','STUDY_RECRUITMENT_STATUS','1618232','2018-02-21 08:34:56.966','60387','INSERT');
      INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618245','ctrpsubstractor','STUDY_INDLDE','1618244','2018-02-21 08:34:57.053','60388','INSERT');
      INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618260','ctrpsubstractor','STUDY_RESOURCING','1618258','2018-02-21 08:34:57.129','60389','INSERT');
      INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618271','ctrpsubstractor','STUDY_INDLDE','1618257','2018-02-21 08:34:57.092','60389','INSERT');
      INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618283','ctrpsubstractor','STUDY_RESOURCING','1618259','2018-02-21 08:34:57.278','60389','INSERT');
      INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618292','ctrpsubstractor','STUDY_SITE','1618291','2018-02-21 08:34:57.604','60390','INSERT');
      INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618302','ctrpsubstractor','STUDY_CONTACT','1618301','2018-02-21 08:34:57.944','60391','INSERT');
      INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618312','ctrpsubstractor','STUDY_SITE','1618311','2018-02-21 08:34:58.065','60392','INSERT');
      INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618321','ctrpsubstractor','STUDY_CONTACT','1618320','2018-02-21 08:34:58.212','60393','INSERT');
      INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618331','ctrpsubstractor','STUDY_SITE','1618330','2018-02-21 08:34:58.298','60394','INSERT');
      INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618341','ctrpsubstractor','STUDY_SITE','1618340','2018-02-21 08:34:58.531','60395','INSERT');
      INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618354','ctrpsubstractor','DOCUMENT','1618351','2018-02-21 08:34:58.797','60396','INSERT');
      INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618363','ctrpsubstractor','DOCUMENT','1618351','2018-02-21 08:34:59.042','60396','UPDATE');
      INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618368','ctrpsubstractor','DOCUMENT','1618350','2018-02-21 08:34:59.042','60396','UPDATE');
      INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618373','ctrpsubstractor','STUDY_PROTOCOL','#{@seed_data['study_milestone_study_protocol_identifier'].gsub("'", "")}','2018-02-21 08:34:59.043','60396','UPDATE');
      INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618375','ctrpsubstractor','DOCUMENT','1618349','2018-02-21 08:34:58.711','60396','INSERT');
      INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618384','ctrpsubstractor','DOCUMENT','1618352','2018-02-21 08:34:59.042','60396','UPDATE');
      INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618389','ctrpsubstractor','DOCUMENT','1618349','2018-02-21 08:34:59.04','60396','UPDATE');
      INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618394','ctrpsubstractor','DOCUMENT','1618353','2018-02-21 08:34:58.858','60396','INSERT');
      INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618403','ctrpsubstractor','DOCUMENT','1618353','2018-02-21 08:34:59.042','60396','UPDATE');
      INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618408','ctrpsubstractor','DOCUMENT','1618352','2018-02-21 08:34:58.831','60396','INSERT');
      INSERT INTO auditlogrecord (id,username,entityname,entityid,createddate,transactionid,type) VALUES ('1618417','ctrpsubstractor','DOCUMENT','1618350','2018-02-21 08:34:58.765','60396','INSERT');
     "
     puts sql_insert_auditlogrecord
end

# insert_auditlogrecord 'ST20182602A'
