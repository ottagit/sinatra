# require 'movie'
require 'yaml/store'

class MovieStore

  def initialize(file_name)
   @store = YAML::Store.new('movies.yml') #create store that reads/writes file_name
  end

  def saveMovie(movie) # save a movie to the store
   @store.transaction do # must be in a transaction
   unless movie.id
    highest_id = @store.roots.max || 0
    movie.id = highest_id + 1
   end
   @store[movie.id] = movie
   end
  end

end
