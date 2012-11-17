require 'spec_helper'



describe FootballAPI do

  shared_examples_for "game method" do |action, game_id|
    before(:each) do
      post "/api/v1/game/start"
      @game_id = rack_mock_session.cookie_jar["game_id"]
    end

    describe "requires a value for game_id" do
      describe 'correct' do
        it 'should be 201' do
          post "/api/v1/game/#{action}", {x: 0, y: 0, game_id: @game_id}
          last_response.status.should == 201
        end
      end

      describe 'invalid' do
        it 'should be 400' do
          post "/api/v1/game/#{action}", {x: 0, y: 0}
          last_response.status.should == 400
        end
      end
    end

    describe "requires a value for x" do
      describe 'present' do
        it 'should be 201' do
          post "/api/v1/game/#{action}", {x: 0, y: 0, game_id: @game_id}
          last_response.status.should == 201
        end
      end

      describe 'nil' do
        it 'should be 400' do
          post "/api/v1/game/#{action}", {y: 0, game_id: @game_id}
          last_response.status.should == 400
        end

        it 'should be 400 for out of bounds x' do
          post "/api/v1/game/#{action}", {y: 0, x: -1, game_id: @game_id}
          last_response.status.should == 400

          post "/api/v1/game/#{action}", {y: 0, x: 5, game_id: @game_id}
          last_response.status.should == 400
        end
      end
    end

    describe "requires a value for y" do
      describe 'present' do
        it 'should be 201' do
          post "/api/v1/game/#{action}", {x: 0, y: 0, game_id: @game_id}
          last_response.status.should == 201
        end
      end

      describe 'nil' do
        it 'should be 400' do
          post "/api/v1/game/#{action}", {x: 0, game_id: @game_id}
          last_response.status.should == 400
        end

        it 'should be 400 for out of bounds y' do
          post "/api/v1/game/#{action}", {y: 3, x: 0, game_id: @game_id}
          last_response.status.should == 400

          post "/api/v1/game/#{action}", {y: -1, x: 0, game_id: @game_id}
          last_response.status.should == 400
        end
      end
    end


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

      context "start" do
        it 'should set user_id in cookies' do
          post "/api/v1/game/start"
          last_response.status.should == 201
          rack_mock_session.cookie_jar["game_id"].should_not be_nil
          JSON.parse(last_response.body)["game_id"].should_not be_nil
        end
      end

      describe "play" do
        describe "shoot" do
          it_should_behave_like "game method", 'shoot'
        end

        describe "save" do
          it_should_behave_like "game method", 'save'
        end
      end
    end


  end
end
