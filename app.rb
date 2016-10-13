require 'sinatra'
require 'movie'
require 'movie_store'

store = MovieStore.new('movies.yml')


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

post('/movies/create') do #submitted form data goes here
  "Received: #{params.inspect}"
  @movie = Movie.new
  @movie.title = params['title']
  @movie.director = params['director']
  @movie.year = params['year']
  store.saveMovie(@movie) #save the object
  redirect('/movies/new') # show a new empty form
end
