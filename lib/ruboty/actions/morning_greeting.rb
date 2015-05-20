module Ruboty
  module Actions
    class MorningGreeting < Base
      def call
        message.reply("hoge")
      end
    end
  end
end
