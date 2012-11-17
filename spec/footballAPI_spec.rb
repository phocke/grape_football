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


    describe 'GET /api/v1/game' do

      it 'should set user_id in cookies' do
        post "/api/v1/game/start"

        last_response.status.should == 201
        rack_mock_session.cookie_jar["user_id"].should_not == nil
      end

    end

  end
end
