require "ruboty/sebastian/version"
require "ruboty/actions/greeting_at_morning"
require "ruboty/actions/greeting_before_closing"
require "ruboty/actions/greeting_at_closing"
require "ruboty/actions/get_event"
require "ruboty/handlers/sebastian"
require "settingslogic"

module Ruboty
  module Sebastian
    class Settings < Settingslogic
      source File.expand_path('../../settings.yml', __dir__)
      namespace "messages"
    end
  end
end
