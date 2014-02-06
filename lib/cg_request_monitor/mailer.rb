require 'action_mailer'

module CgRequestMonitor
  class Mailer < ActionMailer::Base
    self.mailer_name = 'request_monitor_mailer'
    self.append_view_path "#{File.dirname(__FILE__)}/views"

    default from: 'developers@condooms.nl'

    def slow_request_email(request_actions, duration, request_uri = "", request_headers = {})
      @request_actions = request_actions
      @request_duration = duration
      @request_uri = request_uri
      @request_headers = request_headers

      mail(to: CgRequestMonitor.monitor_email_address, subject: "[#{Rails.env}] Slow request: #{duration.round(2)}") do |format|
        format.text
        format.html if CgRequestMonitor.html_email
      end
    end
  end
end