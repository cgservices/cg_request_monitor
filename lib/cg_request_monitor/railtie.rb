require 'cg_request_monitor/middleware/analyze_request_monitor'

module CgRequestMonitor
  class CgRequestMonitorRailtie < Rails::Railtie
    initializer "cg_request_monitor_railtie.configure_rails_initialization" do |app|
      app.middleware.use CgRequestMonitor::Middleware::AnalyzeRequestMonitor, after: Warden::Manager
    end
  end
end

