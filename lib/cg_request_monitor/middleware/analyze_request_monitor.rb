module CgRequestMonitor
  module Middleware
    class AnalyzeRequestMonitor
      def initialize(app, options={})
        @app = app
      end

      def call(env)
        request_duration = Time.now - CgRequestMonitor.start
        if request_duration >= CgRequestMonitor.request_length && CgRequestMonitor.send_email
          CgRequestMonitor::Mailer.slow_request_email(CgRequestMonitor.request_actions, request_duration).deliver
        end
        CgRequestMonitor.request_actions = []
        @app.call(env)
      end
    end
  end
end