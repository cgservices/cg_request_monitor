module CgRequestMonitor
  module Middleware
    class AnalyzeRequestMonitor
      def initialize(app, options={})
        @app = app
      end

      def call(env)
        request = ActionDispatch::Request.new(env)
        parsed_uri = URI.parse(request.original_url)

        if CgRequestMonitor.request_actions.any?
          request_duration = (Time.now - CgRequestMonitor.start).round(3)
          if request_duration >= CgRequestMonitor.request_length && CgRequestMonitor.send_email
            notifications = CgRequestMonitor.request_actions.sort_by{|action| (action[:start] - CgRequestMonitor.start)}
            CgRequestMonitor::Mailer.slow_request_email(notifications, request_duration, parsed_uri).deliver
          end
          CgRequestMonitor.request_actions = []
        end
        @app.call(env)
      end
    end
  end
end