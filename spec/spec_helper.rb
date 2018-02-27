ENV['RACK_ENV'] = 'test'

require("rspec")
require("sinatra/activerecord")
require("employee")
require("project")
