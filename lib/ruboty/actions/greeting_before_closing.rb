module Ruboty
  module Actions
    class GreetingBeforeClosing < Base
      def call
        # 一言目
        message.reply(greetings.header.sample)

        # 二言目
        message.reply(greetings.middle)
      end

      private
      def greetings
        @messages ||= Sebastian::Settings.greeting_before_closing
      end
    end
  end
end
