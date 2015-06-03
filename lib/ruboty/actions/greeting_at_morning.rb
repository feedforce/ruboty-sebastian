module Ruboty
  module Actions
    class GreetingAtMorning < Base
      def call
        week = ["日", "月", "火", "水", "木", "金", "土"]

        # 一言目
        if first_of_year?
          message.reply(greetings.first_of_year.header % now.year)
        else
          message.reply(greetings.header % [now.month, now.day, week[now.wday]])
        end

        #️ 二言目
        tokyodome_event = "" # 後日実装するメソッドからイベントを取得する
        cityhall_event  = "" # 後日実装するメソッドからイベントを取得する

        message.reply(greetings.tokyodome.message % ["【球団戦】", "球団1 - 球団2"]) if tokyodome_event
        message.reply(greetings.cityhall.message  % ["イベント名", "詳細URL"]) if cityhall_event

        # 三言目
        if last_of_year?
          greetings.last_of_year.footer.each {|mes| message.reply(mes)}
        elsif first_of_year?(now)
          message.reply(greetings.first_of_year.footer)
        else
          message.reply(greetings.footer)
        end
      end

      private
      def greetings
        @messages ||= Sebastian::Settings.greeting_at_morning
      end

      def now
        @now ||= Time.now
      end

      def last_of_year?
        weekday = Time.new(now.year, 12, 29).wday

        case weekday
        when 0
          last_day = 27
        when 6
          last_day = 28
        else
          last_day = 29
        end

        now.month == 12 && now.day == last_day ? true : false
      end

      def first_of_year?
        weekday = Time.new(now.year, 1, 5).wday

        case weekday
        when 0
          first_day = 7
        when 6
          first_day = 6
        else
          first_day = 5
        end

        now.month == 1 && now.day == first_day ? true : false
      end
    end
  end
end
