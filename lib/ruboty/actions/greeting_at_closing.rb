module Ruboty
  module Actions
    class GreetingAtClosing < Base
      def call
        message.reply("hoge")
      end
    end
  end
end
