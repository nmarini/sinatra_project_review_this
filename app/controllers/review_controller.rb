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

  get '/reviews/:id/edit' do
    if logged_in?

      @review = Review.find_by_id(params[:id])

      if current_user.reviews.include?(@review)
        erb :'/reviews/edit_reviews'
      else
        redirect "/reviews"
      end
    else
      redirect "/login"
    end
  end

  patch '/reviews/:id' do
    if params[:name] != ""
      @review = Review.find_by_id(params[:id])
      @review.update(:name => params[:name], :description => params[:description], :star_rating => params[:star_rating], :user_id => current_user.id)
      redirect "/reviews/#{@review.id}"
    else
      redirect "/reviews/#{@review.id}/edit"
    end
  end

  delete '/reviews/:id/delete' do
    @review = Review.find_by_id(params[:id])
    if logged_in? && current_user.id == @review.user_id
      @review.delete
      redirect "/reviews"
    else
      redirect "/reviews"
    end
  end






end
