require "open-uri"
require "nokogiri"

# We need a function to scrape IMDB to gets url
def fetch_movies_urls
  top_url = "http://www.imdb.com/chart/top"
  doc = Nokogiri::HTML(open(top_url).read)
  movies = doc.search(".titleColumn a")
  movies.first(5).map do |movie|
    url = movie.attributes["href"].value.split(/\?/).first
    "http://www.imdb.com" + url
  end
end

# We need a function to scrape data on specific movie page
def scrape_movie(url)
  doc = Nokogiri::HTML(open(url, "Accept-Language" => "en").read)
  m = doc.search("h1").text.match /(?<title>.*)[[:space:]]\((?<year>\d{4})\)/
  title = m[:title]
  year = m[:year].to_i
  storyline = doc.search(".summary_text").text.strip
  director = doc.search("[itemprop='director']").text.strip
  cast = doc.search("[itemprop='actor']").take(3).map do |element|
    element.text.strip
  end

  {
    title: title,
    cast: cast,
    director: director,
    storyline: storyline,
    year: year
  }
end
