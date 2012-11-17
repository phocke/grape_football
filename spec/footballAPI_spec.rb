require 'spec_helper'

describe FootballAPI do
  include Rack::Test::Methods

  def app
    FootballAPI
  end

  describe FootballAPI do
    describe 'GET /api/v1/hello' do
      it 'says hello to the world' do
        get "/api/v1/hello"
        last_response.status.should == 200
        JSON.parse(last_response.body)["hello"].should == "world"
      end
    end
  end
end
