require 'action_dispatch'
require 'cg_request_monitor/mailer'
require 'cg_request_monitor/railtie' if defined?(Rails)

module CgRequestMonitor
  mattr_accessor :insert_before, :insert_after, :request_length
  mattr_accessor :request_actions

  def self.request_length
    @@request_length ||= 10
  end

  def self.request_actions
    @@request_actions ||= []
  end
end

ActiveSupport::Notifications.subscribe do |name, start, finish, id, payload|
  duration = (finish - start) * 1000
  CgRequestMonitor.request_actions << {name: name, duration: duration, payload: payload}
end
