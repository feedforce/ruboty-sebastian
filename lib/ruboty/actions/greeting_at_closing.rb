module Ruboty
  module Actions
    class GreetingAtClosing < Base
      def call
        message.reply(messages.header.sample)
        message.reply(messages.middle.sample)
        message.reply(messages.friday.sample) if Time.now.friday? # 金曜日の場合
      end

      def messages
        @messages ||= Sebastian::Settings.greeting_at_closing
      end
    end
  end
end
