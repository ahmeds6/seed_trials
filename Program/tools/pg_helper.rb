require 'pg'
require_relative 'program_logger'



class PgHelper
  def initialize(bd_abbreviation, single_query=true)
    @single_query = single_query
    unless bd_abbreviation.nil?
      begin
        @connection = PG.connect(conn_info(bd_abbreviation))
      rescue PG::Error => e
        ProgramLogger.fail(e.message)
      ensure
      end
    end
  end

  def conn_info(bd_abbreviation)
    {
        :host => ENV['CTRP_DB_HOST'],
        :port => ENV['CTRP_DB_PORT'].to_i,
        :dbname => ENV["CTRP_DB_NAME_#{bd_abbreviation}"],
        :user => ENV["CTRP_DB_USERNAME_#{bd_abbreviation}"],
        :password => ENV["CTRP_DB_PASSWORD_#{bd_abbreviation}"]
    }
  end

  def connect(host, port, dbname, user, password)
    begin
      @connection = PG.connect :host => host, :port => port, :dbname => dbname, :user => user, :password => password
    rescue PG::Error => e
      ProgramLogger.error(e.message)
    ensure
    end
  end

  def execute(sql)
    begin
      rs = @connection.exec(sql)
    rescue PG::Error => e
      ProgramLogger.error(e.message)
      raise e.message
    end
    close if @single_query
    rs.to_a unless rs.nil?
  end

  def tables
    sql = "SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE'"
    schema = execute(sql)
    schema.collect {|s| s['table_name']}
  end

  def columns(table_name)
    sql = "SELECT column_name, data_type, character_maximum_length FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='#{table_name}'"
    schema = execute(sql)
    result = {}
    schema.each {|c_d|
      result[c_d['column_name']] = {data_type: c_d['data_type'], character_maximum_length: c_d['character_maximum_length']}}
    result
  end

  def scan(table_name, params={}, columns=[])
    col = columns.size > 0 ? columns.join(',') : '*'
    sql = "SELECT #{col} FROM #{table_name}"
    if params.size > 0
      query = []
      params.each {|k, v| query << "#{k}='#{v}'" if v.present?}
      sql += " WHERE #{query.join(' AND ')}"
    end
    # ProgramLogger.info("Executing SQL:\n#{sql}")
    execute(sql)
  end

  def random_records(table_name, limit=1, columns=[])
    col = columns.size > 0 ? columns.join(',') : '*'
    sql = "SELECT #{col} FROM #{table_name} ORDER BY RANDOM() LIMIT #{limit}"
    execute(sql)
  end

  def single_column_values(table_name, column, order_asc=true)
    sql = "select #{column} from #{table_name} order by #{column} "
    sql += order_asc ? 'asc' : 'desc'
    response = execute(sql)
    response.collect {|r| r[column]}
  end

  def multiple_column_values(table_name,columns=[], params={},order_asc=true)
    col = columns.size > 0 ? columns.join(',') : '*'
    sql = "select #{col} from #{table_name}"
    if params.size > 0
      query = []
      params.each {|k, v| query << "#{k}='#{v}'" if v.present?}
      sql += " WHERE #{query.join(' AND ')}"
    end
    sql += " order by #{col} "
    sql += order_asc ? 'asc' : 'desc'
   execute(sql)
  end

  def set_value(table_name, value_hash, criteria_hash)
    sql = "UPDATE #{table_name} SET "
    values = []
    criteria = []
    value_hash.each {|k, v| values << "#{k}='#{v}'"}
    criteria_hash.each {|k, v| criteria << "#{k}='#{v}'"}
    sql += "#{values.join(', ')} WHERE #{criteria.join(' AND ')}"
    execute(sql)
  end

  def insert_value(table_name, columns=[],values=[])
    if columns.size != values.size
      flunk 'Number of columns and Values does not match'
    end
    sql = "INSERT INTO #{table_name} "
    col = columns.join(',')
    val = values.join(',')
    sql += "(#{col}) VALUES (#{val})"
    execute(sql)
  end

  def delete(table_name, params={})
    sql = "DELETE FROM #{table_name}"
    if params.size > 0
      query = []
      params.each {|k, v| query << "#{k}='#{v}'" if v.present?}
      sql += " WHERE #{query.join(' AND ')}"
    end
    execute(sql)
  end

  def close
    @connection.close
  end
end

