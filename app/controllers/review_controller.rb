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






end
