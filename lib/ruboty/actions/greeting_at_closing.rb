module Ruboty
  module Actions
    class GreetingAtClosing < Base
      include MessageLoader

      def call
        messages = load_message("greeting_at_closing")

        message.reply("hoge")
      end
    end
  end
end
