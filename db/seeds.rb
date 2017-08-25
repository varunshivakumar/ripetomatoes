# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# user = CreateAdminService.new.call
# puts 'CREATED ADMIN USER: ' << user.email

api_key = "5c6aa64f2306d670d1918784955b7812"
latest = JSON.parse(HTTP.get("https://api.themoviedb.org/3/movie/latest?api_key=#{api_key}&language=en-US"))["id"]

(2..1000).to_a.each do |movie_id|
  data = HTTP.get("https://api.themoviedb.org/3/movie/#{movie_id}?api_key=#{api_key}&language=en-US")
  md = JSON.parse(data)

  movie = Movie.new(
    db_id: md["id"],
    title: md["original_title"],
    summary: md["overview"],
    # genres: md["genre_ids"],
    vote: md["vote_average"],
    poster: md["poster_path"],
    homepage: md["homepage"],
    release_date: md["release_date"],
    runtime: md["runtime"],
    status: md["status"],
    tagline: md["tagline"],
    backdrop: md["backdrop_path"]
  ).save
end

