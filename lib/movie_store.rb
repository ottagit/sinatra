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
  
  def all
   @store.transaction do
    @store[1] = 'Inferno'
    @store[2] = 'The Accountant'
    @store[3] = 'Soko Mjinga'

    #p @store.roots
    p @store.roots.map {|key| @store[key]} 
   end  
  end

end
