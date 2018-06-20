require '../Program/load_data_from_xl'
require '../Program/tools/excel2csv'
require '../Program/tools/csv2json'
require '../Program/tools/readJSON'
require '../Program/env'
require '../Program/update_trial'
require 'csv'
require 'json'
require 'time'
require "json-diff"
require "hashdiff"
require 'yomu'
require 'rest-client'
require 'rest_client'
require 'rubygems'
require 'rspec'
require 'pg'



curren_dir = File.dirname(__FILE__)

puts "current directory: #{curren_dir}"

dt4_formula_dir = "#{curren_dir}/dt4_formula/"

dt4_formula_xlsx = "dt4_seed_data_formula.xlsx"

converted_csv_dir = "#{curren_dir}/converted_csv/"

dt4_formula_csv = "dt4_seed_data_formula.csv"

converted_json_dir = "#{curren_dir}/converted_json/"

dt4_formula_json = "dt4_seed_data_formula.json"

@template_xml_dir = "#{curren_dir}/seed_xml/"

@tmp_file_interventional = "interventional_trial.xml"

@tmp_file_non_interventional = "non_interventional_trial.xml"

@converted_json_dir = "#{curren_dir}/converted_json/"

@dt4_formula_json = "dt4_seed_data_formula.json"




def create_seed_trial(trial_template, seed_trial_id)
  puts ENV['pa_base']
  puts ENV['pa_rest']
  puts ENV['PA_USER_ID']
  puts ENV['PA_USER_PASS']
  @template_file_path = ''
  case trial_template
    when 'complete'
      @template_file_path = "#{@template_xml_dir}#{@tmp_file_interventional}"
      @url = "#{ENV['pa_base']}#{ENV['pa_rest']}"
    when 'abbreviated'
      @template_file_path = "#{@template_xml_dir}#{@tmp_file_non_interventional}"
      @url = "#{ENV['pa_base']}#{ENV['pa_rest']}"
    else
      flunk "trial type mismatch"
  end
  @submit_trial = submit_trial("#{@url}","#{@template_file_path}", "#{ENV['pa_user_id']}", "#{ENV['pa_user_pass']}", "#{seed_trial_id}")
  puts "Trial submit request status: #{@submit_trial.code}"
  @nci_id = Nokogiri.XML(@submit_trial.body).at('nciTrialID').text
  @study_id = Nokogiri.XML(@submit_trial.body).at('paTrialID').text
  puts "Trial has been created and NCI_ID: [#{@nci_id}] and Study ID: [#{@study_id}]"
  update_trial_by_protocol_id @study_id
  test = true
  puts test
end

def submit_trial(service_url, file, user, pass, seed_trial_id)
  @seed_json_data = read_json_from_dir(@converted_json_dir, @dt4_formula_json)
  @seed_data = @seed_json_data.find {|x| x['seedTrialID'] == "#{seed_trial_id}"}
  puts "#{@seed_data['leadOrgTrialID']}"
  puts "#{@seed_data['clinicalTrialsDotGovTrialID']}"
  puts "#{@seed_data['otherTrialID']}"

  if File.file?("#{file}")
    url = service_url
    @headers = {:accept => 'application/xml',:content_type => 'application/xml' }
    @xml = Nokogiri::XML(File.read(file))
    @lead_id = @xml.at_xpath("tns:CompleteTrialRegistration/tns:leadOrgTrialID")
    @lead_id.content = "#{@seed_data['leadOrgTrialID']}"
    @nct_id = @xml.at_xpath("tns:CompleteTrialRegistration/tns:clinicalTrialsDotGovTrialID")
    @nct_id.content = "#{@seed_data['clinicalTrialsDotGovTrialID']}"
    @other_id = @xml.at_xpath("tns:CompleteTrialRegistration/tns:otherTrialID")
    @other_id.content = "#{@seed_data['otherTrialID']}"
    @new = @xml.to_xml
    puts @new
    @response = RestClient::Request.execute method: :post, url: url , user: user, password: pass, :payload => @new, :headers => @headers
  else
    puts "file not present"
  end

end


def generate_trial_from_seed_xl()
  update_json_from_xl
  @seed_json_data = read_json_from_dir(@converted_json_dir, @dt4_formula_json)
  total_items = @seed_json_data.size
  puts "Number of object: #{total_items}"

  if total_items.nil? || total_items<1
    flunk "Seed XL file is empty...."
  else
    $i = 0
    $num = total_items.to_i
    while $i < $num  do
      json_seed_element = @seed_json_data[$i]
      puts("Json record: #$i" )
      puts json_seed_element['seedTrialID']
      puts json_seed_element['seedTrialTemplate']
      create_seed_trial "#{json_seed_element['seedTrialTemplate']}", "#{json_seed_element['seedTrialID']}"
      $i +=1
    end
  end

end


generate_trial_from_seed_xl



