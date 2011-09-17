# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run Caguei::Application

require "rack-facebook-method-fix"
config.middleware.use Rack::Facebook::MethodFix 