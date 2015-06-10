module Ruboty
  module Actions
    class GreetingAtMorning < Base
      include TokyoDomeEvent

      def call
        week = ["日", "月", "火", "水", "木", "金", "土"]

        # 一言目
        if first_of_year?
          message.reply(greetings.first_of_year.header % now.year)
        else
          message.reply(greetings.header % [now.month, now.day, week[now.wday]])
        end

        # 二言目
        tokyodome_event = nil # 後日実装するメソッドからイベントを取得する
        cityhall = get_event_from_cityhall(now) # 後日実装するメソッドからイベントを取得する

        message.reply(greetings.tokyodome.message % ["【球団戦】", "球団1 - 球団2"]) if tokyodome_event
        message.reply(greetings.cityhall.message  % [cityhall[:title], cityhall[:url]]) if cityhall

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

      def now
        @now ||= Time.now
      end

      def last_of_year?
        last = Time.new(now.year, 12, 29)

        last_day = 27 if last.sunday?
        last_day = 28 if last.saturday?
        last_day ||= 29

        now.month == 12 && now.day == last_day
      end

      def first_of_year?
        first = Time.new(now.year, 1, 5)

        first_day = 7 if first.sunday?
        first_day = 6 if first.saturday?
        first_day ||= 5

        now.month == 1 && now.day == first_day
      end
    end
  end
end
