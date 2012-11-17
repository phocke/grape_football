require "rack/test"
require File.expand_path("../../app/footballAPI", __FILE__)

  # set :environment, :test

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end

def app
  FootballAPI
end
