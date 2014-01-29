# CG Request Monitor
Gem to monitor request length using ActiveSupport::Notifiers
All values displayed are in seconds.

## Installation

### In Gemfile
gem 'cg_request_monitor', :git => "git@github.com:cgservices/cg_request_monitor.git"

## Usage
The gem uses certain defaults. To change this you can create an initializer in config/initializers with

Default trigger for request length is set at 60 seconds.

    CgRequestMonitor.request_length = 30

You can turn off the email notification (in case you don't need in certain environments):

    CgRequestMonitor.send_email = true

You can change the email address to which the notification is sent:

    CgRequestMonitor.monitor_email_address = "your.email@address.com"

