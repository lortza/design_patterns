class SimpleLogger
  attr_accessor :level

  ERROR = 1
  WARNING = 2
  INFO = 3

  @@instance = SimpleLogger.new

  def initialize
    @log_file = File.open("singleton/log.txt", 'w')
    @level = WARNING
  end

  def info(msg)
    @log_file.puts("INFO: #{msg}") if @level >= INFO
    @log_file.flush
  end

  def warning(msg)
    @log_file.puts("WARNING: #{msg}") if @level >= WARNING
    @log_file.flush
  end

  def error(msg)
    @log_file.puts("ERROR: #{msg}") if @level >= ERROR
    @log_file.flush
  end

  # return the same instance of this class each time we call it.
  def self.instance
    return @@instance
  end

  # makes sure we can't make more than one instance of this class
  private_class_method :new
end

# logger1 = SimpleLogger.instance
# logger2 = SimpleLogger.instance
#
# p logger1 # #<SimpleLogger:0x00007f7f1d149cd8>
# p logger2 # #<SimpleLogger:0x00007f7f1d149cd8>

# logger = SimpleLogger.new
# logger.level = SimpleLogger::INFO
# logger.info('oyvey2')
# logger.warning('oyvey3')
# logger.error('oyvey4')


SimpleLogger.instance.info('Hello, world.')
# SimpleLogger.instance.warning('Hello, the world is getting really hot.')
# SimpleLogger.instance.error('Hello, the world is on fire.')
# SimpleLogger.instance.info('This is fine.')
