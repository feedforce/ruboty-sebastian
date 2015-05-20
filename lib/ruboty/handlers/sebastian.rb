module Ruboty
  module Handlers
    class Sebastian < Base
      # コマンドのパターン
      on /greet morning/, name: 'greet_morning', description: 'Output greeting message in the morning'
      on /greet beforeclose/, name: 'greet_beforeclose', description: 'Output greeting message before close of buissness'
      on /greet close/, name: 'greet_close', description: 'Output greeting message for close of bissness'

      # コマンドに対応したアクションを呼び出す
      def greet_morning(message)
        Ruboty::Actions::MorningGreeting.new(message).call
      end

      def greet_beforeclose(message)
        Ruboty::Actions::GreetingBeforeClose.new(message).call
      end

      def greet_close(message)
        Ruboty::Actions::ClosingGreeting.new(message).call
      end
    end
  end
end
