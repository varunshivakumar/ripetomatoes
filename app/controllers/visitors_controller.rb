class VisitorsController < ApplicationController


  def index

    @upcoming = Tmdb::Movie.now_playing(region: 'US')['results'][0..5]
    @reviews = @upcoming.map{|movie| Tmdb::Movie.reviews(movie["id"]).results.first }

    @page = params[:page].nil? ? 1 : params[:page]

    if params[:sort_by].nil?
      @data = Tmdb::Movie.popular(page: @page, region: 'US')
    elsif params["sort_by"] == "top_rated"
      @data = Tmdb::Movie.top_rated(page: @page, region: 'US')
    elsif params["sort_by"] == "now_playing"
      @data = Tmdb::Movie.now_playing(page: @page, region: 'US')
    elsif params["sort_by"] == "upcoming"
      @data = Tmdb::Movie.upcoming(page: @page, region: 'US')
    end


    @movies = @data['results']
    @total_pages = @data['total_pages']
    @total_results = @data['total_results']

    respond_to do |format|
      format.html
      format.js
    end
  end

  def genre


    respond_to do |format|
      format.html { render 'visitors/index' }
      format.js
    end

  end
end
