require 'grape'
require 'json'
require 'securerandom'

class FootballAPI < Grape::API
  prefix 'api'
  version 'v1'

  helpers do
    def find_or_create_user
      cookies[:user_id] ||= generate_id
    end

    def generate_id
      SecureRandom.urlsafe_base64(20)
    end
  end

  get 'hello' do
    {:hello => 'world'}.to_json
  end

  namespace :game do

    post 'start' do
      find_or_create_user
    end

  end
end

class User < Struct.new(:name, :surname)
  def full_name
    [name, surname].join(' ')
  end
end
