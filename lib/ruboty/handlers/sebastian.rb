module Ruboty
  module Handlers
    class Sebastian < Base
      # コマンドのパターン
      on /zihou (?<mode>.*)\z/, name: 'zihou', description: 'output zihou'

      # コマンドに対応したアクションを呼び出す
      def zihou(message)
        Ruboty::Actions::Zihou.new(message).call
      end
    end
  end
end
