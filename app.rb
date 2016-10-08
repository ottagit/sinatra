require 'sinatra'
require 'movie'

get('/movies') do
  @movies = Movie.new
  @movies.title = "Jaws"
  erb :index
end
