class ReviewsController < ApplicationController

  def index
    @reviews = Review.all.order('created_at DESC')
  end

  def new
    @review = Review.new
  end

  def create
    @review = current_user.reviews.new(review_params)
    @review.save

    respond_to do |format|
      format.js
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update

  end

  def show

  end

  def delete

  end

  private
    def review_params
      params.require(:review).permit(:user, :rating, :comment, :movie)
    end
end
