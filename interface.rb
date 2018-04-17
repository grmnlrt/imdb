require_relative 'scraper'
require "yaml"

puts "TOP 5 urls"

a_urls = url_finder
puts "Colecting informations"
movie_array = []
a_urls.each do |url|
  movie_array << fetch_informations(url)
end
puts "Store data"

yaml = movie_array.to_yaml
File.open("movies.yml", "wb") do |file|
  file.write(yaml)
end
