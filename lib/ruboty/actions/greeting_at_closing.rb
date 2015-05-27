module Ruboty
  module Actions
    class GreetingAtClosing < Base
      def call
        messages = Sebastian::Settings.greeting_at_closing
        reply_message(messages.header) # 一言目
        reply_message(messages.middle) # 二言目
        reply_message(messages.friday) if Time.now.friday? # 金曜日の場合
      end

      def reply_message(messages)
        message.reply(messages.sample)
      end
    end
  end
end
