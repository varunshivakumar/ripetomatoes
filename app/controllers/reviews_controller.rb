class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = current_user.reviews.new(review_params)

    unless @review.save
      redirect_to :back
    end

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
