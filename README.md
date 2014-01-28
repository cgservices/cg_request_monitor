# CG Request Monitor
Gem to monitor request length using ActiveSupport::Notifiers

## Installation

### In Gemfile
gem 'cg_request_monitor', :git => "git@github.com:cgservices/cg_request_monitor.git"

## Usage
The default for a long request is set at 60 seconds.
To change this you can create an initializer in config/initializers with

    CgRequestMonitor.request_length = 120

You can define where to start and end the request monitor by defining

    CgRequestMonitor.insert_before = "Middleware::Name"
    CgRequestMonitor.insert_after = "Middleware::Name"
