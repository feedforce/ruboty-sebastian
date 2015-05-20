module Ruboty
  module Handlers
    class Sebastian < Base
      # コマンドのパターン
      on /greet morning/, name: 'greet_at_morning', description: 'Output greeting message in the morning'
      on /greet before close/, name: 'greet_before_closing', description: 'Output greeting message before close of buissness'
      on /greet close/, name: 'greet_at_closing', description: 'Output greeting message for close of bissness'

      # コマンドに対応したアクションを呼び出す
      def greet_at_morning(message)
        Ruboty::Actions::GreetingAtMorning.new(message).call
      end

      def greet_before_closing(message)
        Ruboty::Actions::GreetingBeforeClosing.new(message).call
      end

      def greet_at_closing(message)
        Ruboty::Actions::GreetingAtClosing.new(message).call
      end
    end
  end
end
