module Ruboty
  module Handlers
    class Sebastian < Base
      # コマンドのパターン
      on /zihou/, name: 'zihou', description: 'output test'

      # コマンドに対応したアクションを呼び出す
      def zihou(message)
        Ruboty::Actions::Zihou.new(message).call
      end
    end
  end
end
