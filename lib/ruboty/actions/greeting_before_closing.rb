module Ruboty
  module Actions
    class GreetingBeforeClosing < Base
      def call
        message.reply("hoge")
      end

      private
      def greetings
        @messages ||= Sebastian::Settings.greeting_before_closing
      end
    end
  end
end
