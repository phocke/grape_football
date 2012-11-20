require 'grape'
require 'json'
require 'securerandom'
require './app/player'
require './app/round'
require './app/game'

class Xcoordinate < Grape::Validations::Validator
  def validate_param!(attr_name, params)
    if params[attr_name].to_i < 0 or params[attr_name].to_i > 4
      throw :error, :status => 400, :message => "#{attr_name}: must be an integer between 0 and 4 (inclusive)"
    end
  end
end

class Ycoordinate < Grape::Validations::Validator
  def validate_param!(attr_name, params)
    if params[attr_name].to_i < 0 or params[attr_name].to_i > 2
      throw :error, :status => 400, :message => "#{attr_name}: must be an integer between 0 and 4 (inclusive)"
    end
  end
end

class FootballAPI < Grape::API
  prefix 'api'
  version 'v1'
  format :json


  helpers do
    def find_or_create_game
      cookies[:game_id] ||= generate_id
    end

    def generate_id
      SecureRandom.urlsafe_base64(20)
    end
  end

  get 'hello' do
    {:hello => 'world'}.to_json
  end


  resource :game do
    post :start do
      find_or_create_game
      {game_id: cookies[:game_id]}
    end

    namespace '' do
      params do
        requires :x, :xcoordinate => true, desc: "X coordinate"
        requires :y, :ycoordinate => true, desc: "Y coordinate"
        requires :game_id, type: String, desc: "Id of the game you're playing - can be obtained at /games/start"
      end
      post :shoot do
        true
      end

      params do
        requires :x, :xcoordinate => true, desc: "X coordinate"
        requires :y, :ycoordinate => true, desc: "Y coordinate"
        requires :game_id, type: String, desc: "Id of the game you're playing - can be obtained at /games/start"
      end
      post :save do
        true
      end
    end
  end
end



