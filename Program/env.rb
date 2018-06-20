

ENV['APP_ENV_SELECT'] = 'local'

base_local = 'http://localhost:18080/'
base_aws = 'https://trials-int.nci.nih.gov/'

pa_app = 'pa'
registry_app = 'registry'
accrual_app = 'accrual/'
po_app = 'po-web/'
rest_endpoint = 'services/trials/complete/'

puts "######Environment:[#{ENV['APP_ENV_SELECT'].to_s}]#######"

case ENV['APP_ENV_SELECT']
  when 'local'
    ENV['CTRP_DB_HOST'] = 'localhost'
    ENV['CTRP_DB_PORT'] = '5432'
    ENV['CTRP_DB_NAME_DW'] = 'dw_ctrpn'
    ENV['CTRP_DB_NAME_PA'] = 'pa_ctrpn'
    ENV['CTRP_DB_NAME_PO'] = 'po_ctrpn'
    ENV['CTRP_DB_USERNAME_PA'] = 'pauser'
    ENV['CTRP_DB_PASSWORD_PA'] = 'pauser'
    ENV['pa_base'] = "#{base_local}"
    ENV['pa_rest'] = "#{rest_endpoint}"
    ENV['pa_user_id'] = 'ctrpsubstractor'
    ENV['pa_user_pass'] = 'pass'
    ENV['rest_headers'] = "{:accept => 'application/xml',:content_type => 'application/xml' }"
  when 'aws'
    ENV['CTRP_DB_HOST'] = 'ctrp-inttest.clb9vkosemwm.us-east-1.rds.amazonaws.com'
    ENV['CTRP_DB_PORT'] = '5432'
    ENV['CTRP_DB_NAME_DW'] = 'dw_ctrpn'
    ENV['CTRP_DB_NAME_PA'] = 'pa_ctrpn'
    ENV['CTRP_DB_NAME_PO'] = 'po_ctrpn'
    ENV['CTRP_DB_USERNAME_PA'] = 'pauser'
    ENV['CTRP_DB_PASSWORD_PA'] = 'pauser'
    ENV['pa_base'] = "#{base_aws}"
    ENV['pa_rest'] = "#{rest_endpoint}"
    ENV['pa_user_id'] = 'ctrpsubstractor'
    ENV['pa_user_pass'] = 'pass'
    ENV['rest_headers'] = "#{{:accept => 'application/xml',:content_type => 'application/xml' }}"
  else
    puts 'Please choose correct Environment.'
end


