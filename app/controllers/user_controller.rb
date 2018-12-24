class UserController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'user/create_user'
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

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect "/reviews"
    end
  end

  post '/login' do
    if @user = User.find_by(:username => params[:username])
      if @user.authenticate(params[:password])
        login(@user.id)
        redirect "/reviews"
      else
        redirect "/signup"
      end
    else
      redirect "/signup"
    end
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect '/login'
    else
      redirect '/'
    end
  end

  private

  def login(id)
    session[:user_id] = id
  end

end
