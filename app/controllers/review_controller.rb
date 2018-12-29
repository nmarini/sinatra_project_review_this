class ReviewController < ApplicationController

  get '/review' do
    if logged_in?
      @reviews = Review.all
      erb :'reviews/reviews'
    else
      redirect "/login"
    end
  end


end
