require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "review_this_secret"
  end

  get '/' do
    erb :index
  end

  helpers do

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

    def convert_rating(star_rating)
      if star_rating == 1
        "Terrible!"
      elsif star_rating == 2
        "Just OK"
      else
        "Great!"
      end
    end
  end
end
