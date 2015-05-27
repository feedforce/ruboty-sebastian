require "ruboty/sebastian/version"
require "ruboty/actions/greeting_at_morning"
require "ruboty/actions/greeting_before_closing"
require "ruboty/actions/greeting_at_closing"
require "ruboty/handlers/sebastian"

module Ruboty
  module Sebastian
    class Settings < Settingslogic
      source File.expand_path('../../settings.yml', File.dirname(__FILE__))
      namespace "messages"
    end

    def load_message(type)
      Settings.send(type)
    end
  end
end
