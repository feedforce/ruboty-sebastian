module Ruboty
  module Actions
    class GreetingAtMorning < Base
      def call
        greetings = Sebastian::Settings.greeting_at_morning

        now  = Time.new
        week = ["日", "月", "火", "水", "木", "金", "土"]

        message.reply(sprintf(greetings.header, now.month, now.day, week[now.wday])) # 一言目
      end
    end
  end
end
