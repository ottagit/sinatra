require 'sinatra'
require 'movie'
require 'movie_store'

store = MovieStore.new('movies.yml')


get('/movies') do
   @movies = store.all 
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
