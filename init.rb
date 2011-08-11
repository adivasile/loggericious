# Include hook code here
require 'loggericious'
ActiveSupport::BufferedLogger.send :include, Loggericious
