module CgRequestMonitor
  module Middleware
    class AnalyzeRequestMonitor
      def initialize(app, options={})
        @app = app
      end

      def call(env)
        request_duration = CgRequestMonitor.request_actions.inject(0){|total_request_duration, action| total_request_duration += action[:duration]; total_request_duration}
        if request_duration >= (CgRequestMonitor.request_length * 1000)
          CgRequestMonitor::Mailer.slow_request_email(CgRequestMonitor.request_actions, (request_duration / 1000)).deliver
        end
        CgRequestMonitor.request_actions = []
        @app.call(env)
      end
    end
  end
end