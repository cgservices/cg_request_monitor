require 'action_dispatch'
require 'cg_request_monitor/mailer'
require 'cg_request_monitor/railtie' if defined?(Rails)

module CgRequestMonitor
  mattr_accessor :insert_before, :insert_after, :request_length, :monitor_email_address, :send_email
  mattr_accessor :request_actions, :start

  def self.request_length
    @@request_length ||= 60
  end

  def self.send_email
    @@send_email ||= true
  end

  def self.request_actions
    @@request_actions ||= []
  end

  def self.monitor_email_address
    @@monitor_email_address ||= "your.email@address.com"
  end
end

ActiveSupport::Notifications.subscribe do |name, start, finish, id, payload|
  duration = (finish - start).round(3)
  CgRequestMonitor.start = start if CgRequestMonitor.request_actions.empty?
  CgRequestMonitor.request_actions << {name: name, duration: duration, payload: payload, start: start, finish: finish}
end
