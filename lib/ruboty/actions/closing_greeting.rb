module Ruboty
  module Actions
    class ClosingGreeting < Base
      def call
        message.reply("hoge")
      end
    end
  end
end
