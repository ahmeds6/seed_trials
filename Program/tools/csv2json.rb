require 'rubygems'
require 'json'
require 'csv'


def read_csv(directory, csv_file_name)
  csv_directory = directory
  csv_path = "#{csv_directory}#{csv_file_name}"
  unless File.exist?(csv_path)
    flunk "File does not exists"
  end
  rd_csv = File.read(csv_path)
end

def csv_to_json(dir_path, json_file_name, json_content)
  unless Dir.exist?(dir_path)
    Dir.mkdir(dir_path, 0777)
  end
  File.open("#{dir_path}#{json_file_name}","w") do |f|
    f.write(json_content.to_json)
  end
end

def is_int(str)
  # Check if a string should be an integer
  return !!(str =~ /^[-+]?[1-9]([0-9]*)?$/)
end

def convert_csv_to_json csv_file_path_nm, json_file_path_nm

  lines = CSV.open(csv_file_path_nm).readlines
  keys = lines.delete lines.first

  File.open(json_file_path_nm, "w") do |f|
    data = lines.map do |values|
      is_int(values) ? values.to_i : values.to_s
      Hash[keys.zip(values)]
    end
    f.puts JSON.pretty_generate(data)
  end

end

def if_json_exists (csv_file_dir, csv_file_nm)
  @csv_directory_n_file = "#{csv_file_dir}#{csv_file_nm}"
  if File.file?("#{@csv_directory_n_file}")
    puts "#{csv_file_nm} already exists in the dir[ #{csv_file_dir} ]. Deleting the file:[ #{csv_file_nm} ] first"
    file_to_be_deleted = "#{@csv_directory_n_file}"
    File.delete(file_to_be_deleted) if File.exist?(file_to_be_deleted)
  end
end