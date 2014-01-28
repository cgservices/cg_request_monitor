require 'action_mailer'

module CgRequestMonitor
  class Mailer < ActionMailer::Base
    self.mailer_name = 'request_monitor_mailer'
    self.append_view_path "#{File.dirname(__FILE__)}/views"

    default from: 'developers@condooms.nl'

    def slow_request_email(request_actions, duration)
      @request_actions = request_actions
      @request_duration = duration
      mail(to: 'luis@cg.nl', subject: "Slow request: #{duration.round(2)}") do |format|
        format.text
        format.html
      end
    end
  end
end