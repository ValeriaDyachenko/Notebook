# This file is used by Rack-based servers to start the application.

require 'compass_twitter_bootstrap'
require ::File.expand_path('../config/environment',  __FILE__)
run Rails.application
