require 'sinatra'
require 'movie'

get('/movies') do
  @movies = []
  @movies[0] = Movie.new
  @movies[0].title = "Jaws"
  @movies[1] = Movie.new
  @movies[1].title = "Taken"
  @movies[2] = Movie.new
  @movies[2].title = "Taken 2" 
  erb :index
end

get('/movies/new') do
  erb :new
end

post('/movies/create') do
  "Received: #{params.inspect}"
  @movie = Movie.new
  @movie.title = params['title']
  @movie.director = params['director']
  @movie.year = params['year']
end
