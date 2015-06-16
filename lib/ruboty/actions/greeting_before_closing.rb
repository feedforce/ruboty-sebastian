module Ruboty
  module Actions
    class GreetingBeforeClosing < Base
      include TokyoDomeEvent

      def call
        # 一言目
        message.reply(greetings.header.sample)

        # 二言目
        message.reply(greetings.middle)

        # 三言目
        tokyodome = get_event_from_dome(now)
        cityhall  = get_event_from_cityhall(now)

        message.reply(greetings.tokyodome.message % tokyodome) if tokyodome
        message.reply(greetings.cityhall.message  % cityhall)  if cityhall
      end

      private
      def greetings
        @messages ||= Sebastian::Settings.greeting_before_closing
      end
    end
  end
end
