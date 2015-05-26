module Ruboty
  module Actions
    class GreetingAtClosing < Base
      include MessageLoader

      def call
        messages = load_message("greeting_at_closing")

        message.reply(messages.header[Random.new.rand(0..2)]) # 一言目
      end
    end
  end
end
