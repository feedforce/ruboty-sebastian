module Ruboty
  module Actions
    class GreetingAtClosing < Base
      def call
        messages = load_message("greeting_at_closing")

        reply_message(messages.header) # 一言目
        reply_message(messages.middle) # 二言目
        reply_message(messages.friday) if Time.now.friday? # 金曜日の場合
      end

      def reply_message(messages)
        mes = messages[Random.new.rand(0...(messages.size))]
        message.reply(mes) if mes 
      end
    end
  end
end
