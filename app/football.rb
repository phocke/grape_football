class FootballAPI < Grape::API
  version 'v1', :using => :header, :vendor => 'twitter'
  format :json

  helpers do
    def current_user
      @current_user ||= User.new('Czarek', 'Skwarek')
    end

    def authenticate!
      error!('401 Unauthorized', 401) unless current_user
    end
  end

  resource :hi do

    desc "Check if it works"
    get :there do
      current_user
    end

  end
end

class User < Struct.new(:name, :surname)
  def full_name
    [name, surname].join(' ')
  end
end
