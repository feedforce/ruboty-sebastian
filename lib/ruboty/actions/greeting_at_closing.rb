module Ruboty
  module Actions
    class GreetingAtClosing < Base
      include MessageLoader

      def call
        messages = load_message("greeting_at_closing")

        message.reply(messages.header[Random.new.rand(0..2)]) # 一言目
        message.reply(messages.middle[Random.new.rand(0..2)]) # 二言目
        message.reply(messages.friday[Random.new.rand(0..1)]) if Time.now.friday?
      end
    end
  end
end
