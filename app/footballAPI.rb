require 'grape'
require 'json'

class FootballAPI < Grape::API
  prefix 'api'
  version 'v1'

  get 'hello' do
    {:hello => 'world'}.to_json
  end


end

class User < Struct.new(:name, :surname)
  def full_name
    [name, surname].join(' ')
  end
end
