module Ruboty
  module Actions
    class GreetingAtMorning < Base
      def call
        now  = Time.now
        week = ["日", "月", "火", "水", "木", "金", "土"]

        # 一言目
        if now.month == 1 && now.day == 1
          message.reply(sprintf(greetings.first_of_year.header, now.year))
        else
          message.reply(sprintf(greetings.header, now.month, now.day, week[now.wday]))
        end
      end

      def greetings
        @messages ||= Sebastian::Settings.greeting_at_morning
      end
    end
  end
end
