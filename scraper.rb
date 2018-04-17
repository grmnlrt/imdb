require 'open-uri'
require 'nokogiri'

# We need a function to scrape IMDB to gets url
def url_finder
  url = "https://www.imdb.com/chart/top"
  html_content = open(url).read

  html_noko = Nokogiri::HTML(html_content)
  css_selector = ".titleColumn a"
  html_noko.search(css_selector).first(5).map do |elem|
    ("https://www.imdb.com" + elem.attributes["href"].value).split("?")[0]
  end

end

def fetch_informations(url)
  html_content = open(url, "Accept-Language" => "en").read
  html_noko = Nokogiri::HTML(html_content)
  cast = html_noko.search("[itemprop='actors']").map { |name| name.text.strip.gsub(",","") }
  director = html_noko.search("[itemprop='director']").text.strip
  storyline = html_noko.search(".inline.canwrap p").text.split("Written by")[0].strip
  match_data = html_noko.search(".title_wrapper h1").text.match(/(?<title>.*)[[:space:]]\((?<year>.*)\)/)
  title = match_data[:title]
  year = match_data[:year].to_i
  {
    cast: cast,
    director: director,
    storyline: storyline,
    title: title,
    year: year
  }
end


# We need a function to scrape data on specific movie page
