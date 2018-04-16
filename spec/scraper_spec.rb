require_relative "../scraper"

describe "#fetch_movies_urls" do
  it "should return an array of movies" do
    urls = fetch_movies_urls
    expected = [
      "http://www.imdb.com/title/tt0111161/",
      "http://www.imdb.com/title/tt0068646/",
      "http://www.imdb.com/title/tt0071562/",
      "http://www.imdb.com/title/tt0468569/",
      "http://www.imdb.com/title/tt0050083/"
    ]
    expect(urls).to eq(expected)
  end
end

describe "#scrape_movie" do
  it "should return a Hash describing a movie" do
    the_dark_knight_url = "http://www.imdb.com/title/tt0468569/"
    movie = scrape_movie(the_dark_knight_url)

    expected = {
      cast: [ "Christian Bale", "Heath Ledger", "Aaron Eckhart" ],
      director: "Christopher Nolan",
      storyline: "When the menace known as the Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham, the Dark Knight must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
      title: "The Dark Knight",
      year: 2008
    }

    expect(movie).to eq(expected)
  end
end
