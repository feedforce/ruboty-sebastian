module Ruboty
  module Actions
    class GreetingBeforeClosing < Base
      def call
        # 一言目
        message.reply(greetings.header.sample)

        # 二言目
        message.reply(greetings.middle)

        # 三言目
        tokyodome_event = "" # 後日実装するメソッドからイベントを取得する
        cityhall_event  = "" # 後日実装するメソッドからイベントを取得する

        message.reply(greetings.tokyodome.message % ["【球団戦】", "球団1 - 球団2"]) if tokyodome_event
        message.reply(greetings.cityhall.message % ["イベント名", "詳細URL"]) if cityhall_event
      end

      private
      def greetings
        @messages ||= Sebastian::Settings.greeting_before_closing
      end
    end
  end
end
