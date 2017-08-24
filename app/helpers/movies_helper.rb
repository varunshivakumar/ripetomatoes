module MoviesHelper

  def get_genre(id)
    # TODO: sort the data manually and use binary search to find id
    data = '{"genres":[{"id":28,"name":"Action"}, {"id":12,"name":"Adventure"},{"id":16,"name":"Animation"},{"id":35,"name":"Comedy"},{"id":80,"name":"Crime"},{"id":99,"name":"Documentary"},{"id":18,"name":"Drama"},{"id":10751,"name":"Family"},{"id":14,"name":"Fantasy"},{"id":36,"name":"History"},{"id":27,"name":"Horror"},{"id":10402,"name":"Music"},{"id":9648,"name":"Mystery"},{"id":10749,"name":"Romance"},{"id":878,"name":"Science Fiction"},{"id":10770,"name":"TV Movie"},{"id":53,"name":"Thriller"},{"id":10752,"name":"War"},{"id":37,"name":"Western"}]}'
    genres = JSON.parse(data)["genres"]
    for genre in genres
      if genre["id"] == id
        return genre["name"]
      end
    end
    "Other"
  end


end
