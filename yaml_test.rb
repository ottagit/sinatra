require 'movie' #load the Movie class
require 'yaml/store' #load the YAML::Store class


store = YAML::Store.new('test.yml') #create store that writes objects to test.yml

first_movie = Movie.new #create a Movie object
first_movie.title = "George of the Jungle"
first_movie.director = "John Doe"
first_movie.year = 2004

second_movie = Movie.new #another Movie object
second_movie.title = "London Has Fallen"
second_movie.director = "Jane Doe"
second_movie.year = 2015


store.transaction do #prevent other programs from writing to the file
  store["George of the Jungle"] = first_movie #store movie1, assigning it as a key value
  store["London Has Fallen"] = second_movie #store movie2, assigning it as a key value

  p store["George of the Jungle"] #print a debug string for one of the movies,
                                  #retrieving the value as in a hash
end
