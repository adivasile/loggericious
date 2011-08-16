
require "loggericious/version"

module Loggericious
  def self.included(klass)
    klass.alias_method_chain(:add, :taste)
  end

  def add_with_taste(severity, message = nil, progname = nil, &block)
    controller_indent = "\t";
    before_blank = ""
    after_blank = ""
    renderer_indent = ""
    params = false;
    reset = "\e[0m"
    message = message.to_s
    case severity
      when 1 then
        color = "\e[33m"
      when 6 then
        color = "\e[36m"
      when 4 then
        color = "\e[3;31m"
    end

    r = /Processing (.*)/
    if r.match(message.strip)
      controller_indent = "";
      before_blank = "\n\n"
    end

    r = /Parameters: (.*)/
    if r.match(message.strip)
      color = "\e[3;32m"
    end

    r = /Rendered (.*)/
    if r.match(message.strip)
      renderer_indent = "    "
    end
    message = "#{before_blank}#{timestamp} #{controller_indent}#{renderer_indent}#{color}#{message.strip}#{reset}#{after_blank}\n"
    buffer << message
  end

  def timestamp
    return "\e[3;32m#{Time.now.strftime("%H:%M:%S")}\e[0m #"
  end

  def taste(message = nil, progname = nil, &block)
    message = message.inspect unless message.is_a?(String)
    message = " >>>>> " + message + " <<<<<< "
    add(6, message, progname = nil, &block)
  end

end



