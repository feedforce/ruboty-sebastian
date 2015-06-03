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

        message.reply(greetings.tokyodome.message % ["【球団戦】", "球団1 - 球団2"]) if tokyodome_event
        message.reply(greetings.cityhall.message  % ["イベント名", "詳細URL"]) if cityhall_event

        # 三言目
        if "実行年の最終出社日である"
          greetings.last_of_year.footer.each {|mes| message.reply(mes)}
        elsif now.month == 1 && now.day == 1
          message.reply(greetings.first_of_year.footer)
        else
          message.reply(greetings.footer)
        end
      end

      private
      def greetings
        @messages ||= Sebastian::Settings.greeting_at_morning
      end

      def last_of_year?
      end
    end
  end
end
