require 'yaml'

module Ruboty
  module Actions
    class Zihou < Base
      def call
        message.reply(zihou)
      end

      private
      # setting.ymlから表示するメッセージを取得
      def zihou
        mode = message[:mode]

        case mode
        when "scheduler_today"
          scheduler_today
        when "scheduler"
          scheduler
        when "before_period"
          before_period
        when "period"
          period
        end
      end

      # 朝の挨拶
      def scheduler_today

      end

      # 本日の予定
      def scheduler

      end

      # 業務終了時間のお知らせ
      def before_period

      end

      # 業務終了のお知らせ
      def period
        
      end

      # setting.ymlから表示するメッセージを取得
      def get_message(mode, type)
        
      end
    end
  end
end
