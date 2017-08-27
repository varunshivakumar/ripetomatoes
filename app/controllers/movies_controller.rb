class MoviesController < ApplicationController

  def show
    @movie = Tmdb::Movie.detail(params[:id])
  end


end
