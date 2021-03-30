module Log
  module Loggable
    def log_debug(message)
      log(message, :debug)
    end

    def log_info(message)
      log(message, :info)
    end

    def log_warning(message)
      log(message, :warning)
    end

    def log_error(message)
      log(message, :error)
    end

    # @param severity [Symbol] :debug, :info, :warning, :error
    def log(message, severity = :info)
      color = {
        debug: :blue,
        info: :white,
        warning: :yellow,
        error: :red
      }[severity]

      puts message.send(color)
    end
  end
end