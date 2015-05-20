module Ruboty
  module Actions
    class GreetingBeforeClose < Base
      def call
        message.reply("hoge")
      end
    end
  end
end
