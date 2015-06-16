module Ruboty
  module Actions
    class GreetingAtMorning < Base
      include TokyoDomeEvent
      include Workday

      def call
        week = ["日", "月", "火", "水", "木", "金", "土"]

        # 一言目
        if first_of_year?
          message.reply(greetings.first_of_year.header % now.year)
        else
          message.reply(greetings.header % [now.month, now.day, week[now.wday]])
        end

        # 二言目
        tokyodome = get_event_from_dome
        cityhall  = get_event_from_cityhall

        message.reply(greetings.tokyodome.message % tokyodome) if tokyodome
        message.reply(greetings.cityhall.message  % cityhall)  if cityhall

        # 三言目
        if last_of_year?
          greetings.last_of_year.footer.each {|mes| message.reply(mes)}
        elsif first_of_year?
          message.reply(greetings.first_of_year.footer)
        else
          message.reply(greetings.footer)
        end
      end

      private
      def greetings
        @messages ||= Sebastian::Settings.greeting_at_morning
      end
    end
  end
end
