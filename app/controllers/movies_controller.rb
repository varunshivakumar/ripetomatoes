class MoviesController < ApplicationController

  def show
    @review = Review.new
    @movie = Tmdb::Movie.detail(params[:id])
    @movie_reviews = Review.where(movie: @movie.id)
  end


end
