module Ruboty
  module Actions
    class GreetingBeforeClosing < Base
      def call
        message.reply("hoge")
      end
    end
  end
end
