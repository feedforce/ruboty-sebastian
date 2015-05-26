module Ruboty
  module Actions
    class GreetingAtMorning < Base
      def call
        message.reply("hoge")
      end
    end
  end
end
