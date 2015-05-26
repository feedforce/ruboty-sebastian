require 'settingslogic'

module MessageLoader
  class Settings < Settingslogic
    source File.expand_path('../../settings.yml', File.dirname(__FILE__))
    namespace "messages"
  end

  def load_message(type)
    Settings.send(type)
  end
end
