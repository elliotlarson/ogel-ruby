# frozen_string_literal: true

require('tty-prompt')

module Ogel
  class Console
    def print_bye
      tty.ok('bye')
    end

    def print_cmd(cmd_string)
      tty.say(color.cyan("$ #{cmd_string}"))
    end

    def select_from_list(message:, list:)
      tty.enum_select(color.yellow(message), list, per_page: 15)
    rescue TTY::Reader::InputInterrupt
      puts
      puts
      print_bye
      exit 130 # ctrl-c exit code
    end

    def multi_select_from_list(message:, list:)
      tty.multi_select(color.yellow(message), list, per_page: 15, echo: false)
    rescue TTY::Reader::InputInterrupt
      puts
      puts
      print_bye
      exit 130 # ctrl-c exit code
    end

    private

    def tty
      @_tty ||= TTY::Prompt.new
    end

    def color
      @_color ||= Pastel.new
    end
  end
end
