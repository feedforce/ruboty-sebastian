module Ruboty
  module Actions
    class GreetingAtClosing < Base
      def call
        message.reply(greetings.header.sample)
        message.reply(greetings.middle.sample)
        message.reply(greetings.friday.sample) if Time.now.friday? # 金曜日の場合
      end

      private
      def greetings
        @greetings ||= Sebastian::Settings.greeting_at_closing
      end
    end
  end
end
