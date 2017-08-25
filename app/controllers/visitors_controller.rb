class VisitorsController < ApplicationController


  def index

    @page = params[:page].nil? ? 1 : params[:page]
    @sort_by = params[:sort_by].nil? ? "popular" : params[:sort_by]

    @api_key = "5c6aa64f2306d670d1918784955b7812"

    request = HTTP.get("https://api.themoviedb.org/3/movie/#{@sort_by}?page=#{@page}&api_key=#{@api_key}&language=en-US")

    @data = JSON.parse(request)

    @movies = @data['results']
    @total_pages = @data['total_pages']
    @total_results = @data['total_results']

    respond_to do |format|
      format.html
      format.js
    end
  end

  def release_date
    @page = params[:page].nil? ? 1 : params[:page]
    @api_key = "5c6aa64f2306d670d1918784955b7812"

    latest = JSON.parse(HTTP.get("https://api.themoviedb.org/3/movie/#{@sort_by}?&api_key=#{@api_key}"))["id"]
    request = HTTP.get("https://api.themoviedb.org/3/movie/#{@sort_by}?&api_key=#{@api_key}")

    movies = []

    (latest-(20 * @page)..latest-(20 * (@page - 1))).to_a.each do |movie_id|
      data = HTTP.get("https://api.themoviedb.org/3/movie/#{movie_id}?api_key=#{api_key}&language=en-US")
      md = JSON.parse(data)
      movies << md
    end

  end
end
