require '../Program/tools/excel2csv'
require '../Program/tools/csv2json'
require 'csv'
require 'json'

curren_dir = File.dirname(__FILE__)

puts "current directory: #{curren_dir}"

@dt4_formula_dir = "#{curren_dir}/dt4_formula/"

@dt4_formula_xlsx = "dt4_seed_data_formula.xlsx"

@converted_csv_dir = "#{curren_dir}/converted_csv/"

@dt4_formula_csv = "dt4_seed_data_formula.csv"

@converted_json_dir = "#{curren_dir}/converted_json/"

@dt4_formula_json = "dt4_seed_data_formula.json"


def load_seed_trial_data(csv_dir, csv_f_nm, formula_dir, formula_file, jsn_dir, jsn_f_nm)


  if_csv_exists csv_dir, csv_f_nm

  dt4_formula_file_csv = "#{csv_dir}#{csv_f_nm}"
  dt4_formula_file_xlsx = "#{formula_dir}#{formula_file}"

  convert_excel_2_csv(dt4_formula_file_xlsx, dt4_formula_file_csv)


  if File.file?("#{csv_dir}#{csv_f_nm}")
    puts "csv file: #{csv_dir}#{csv_f_nm}"
  else
    flunk "unable to convert csv file: #{csv_f_nm} in the dir: [ #{csv_dir} ]"
  end

  rd_csv = read_csv csv_dir, csv_f_nm
  puts rd_csv

  if_json_exists jsn_dir, jsn_f_nm

  csv_file_path = "#{csv_dir}#{csv_f_nm}"
  jsn_file_path = "#{jsn_dir}#{jsn_f_nm}"

  convert_csv_to_json csv_file_path, jsn_file_path

  if File.file?("#{jsn_dir}#{jsn_f_nm}")
    puts "json file: #{jsn_dir}#{jsn_f_nm}"
  else
    flunk "unable to convert json file: #{jsn_f_nm} in the dir: [ #{jsn_dir} ]"
  end

end

def update_json_from_xl()
  load_seed_trial_data @converted_csv_dir, @dt4_formula_csv, @dt4_formula_dir, @dt4_formula_xlsx, @converted_json_dir, @dt4_formula_json
end

# update_json_from_xl




