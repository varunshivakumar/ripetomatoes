class VisitorsController < ApplicationController


  def index
    api_key = "5c6aa64f2306d670d1918784955b7812"
    request = HTTP.get("https://api.themoviedb.org/3/movie/popular?api_key=#{api_key}&language=en-US")
    @data = JSON.parse(request)
    @movies = @data['results']
    @page = @data['page']
    @total_pages = @data['total_pages']
    @total_results = @data['total_results']
  end
end
