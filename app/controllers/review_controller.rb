class ReviewController < ApplicationController

  get '/review' do
    if logged_in?
      @reviews = Review.all
      erb :'reviews/reviews'
    else
      redirect "/login"
    end
  end

  get '/reviews/new' do
    if logged_in?
      erb :'reviews/new'
    else
      redirect "/login"
    end
  end

  post '/reviews' do
    if params[:name] != ""
      @review = Review.create(:name => params[:name], :description => params[:description], :star_rating => params[:star_rating], :user_id => current_user.id)
      redirect "/reviews/#{@review.id}"
    else
      redirect "/reviews/new"
    end
  end

  get '/reviews/:id' do
    if logged_in?
      @review = Review.find_by_id(params[:id])
      redirect "/reviews/#{@review.id}"
    else
      redirect "/login"
    end
  end








end
