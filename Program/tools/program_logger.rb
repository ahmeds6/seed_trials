class ProgramLogger
  @hide_log = false

  def self.hide_log(hide=true)
    @hide_log = hide
  end

  def self.info(message, print_time=false)
    return if @hide_log
    time = print_time ? " #{Time.now.to_s} " : ''
    puts "[SEED_DATA_CREATION_ERROR #{time}]: #{message}" unless @hide_log
  end

  def self.error(message)
    puts "[SEED_DATA_CREATION_ERROR #{Time.now.to_s} ]: #{message}"
  end

  def self.warning(message)
    puts "[SEED_DATA_CREATION_ERROR #{Time.now.to_s} ]: #{message}"
  end

  def self.fail(message)
    puts "[SEED_DATA_CREATION_ERROR #{Time.now.to_s} ]: #{message}"
    raise message
  end
end