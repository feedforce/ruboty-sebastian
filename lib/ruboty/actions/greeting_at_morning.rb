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

        #️ 二言目
        tokyodome_event = "" # 後日実装するメソッドからイベントを取得する
        cityhall_event  = "" # 後日実装するメソッドからイベントを取得する

        message.reply(sprintf(greetings.tokyodome.message, "【球団戦】", "球団1 - 球団2")) if tokyodome_event
        message.reply(sprintf(greetings.cityhall.message,  "イベント名", "詳細URL")) if cityhall_event
      end

      def greetings
        @messages ||= Sebastian::Settings.greeting_at_morning
      end
    end
  end
end
