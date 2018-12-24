class UserController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'users/create_user'
    else
      redirect "/reviews"
    end
  end

  post '/singup' do
    if logged_in?
      redirect "/signup"
    else
      if params[:username] == "" || params[:email] == "" || params[:password] == ""
        redirect "/singup"
      else
        @user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
        @user.save
        login(@user.id)
        redirect "/reviews"
      end
    end
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end

end
