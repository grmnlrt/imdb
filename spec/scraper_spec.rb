require_relative "../scraper"
describe '#url_finder' do
  it 'should return an array of url movie' do
    result = url_finder
    expected = [
      "https://www.imdb.com/title/tt0111161/",
      "https://www.imdb.com/title/tt0068646/",
      "https://www.imdb.com/title/tt0071562/",
      "https://www.imdb.com/title/tt0468569/",
      "https://www.imdb.com/title/tt0050083/"
    ]
    expect(result).to eq(expected)
  end
end

describe '#fetch_informations' do
  it 'should return a hash of a movie' do
    result = fetch_informations("https://www.imdb.com/title/tt0111161/")
    expected = {
      cast:["Tim Robbins","Morgan Freeman","Bob Gunton"],
      director: "Frank Darabont",
      storyline: "Chronicles the experiences of a formerly successful banker as a prisoner in the gloomy jailhouse of Shawshank after being found guilty of a crime he did not commit. The film portrays the man's unique way of dealing with his new, torturous life; along the way he befriends a number of fellow prisoners, most notably a wise long-term inmate named Red.",
      title: "The Shawshank Redemption",
      year: 1994
    }

    expect(result).to eq(expected)
  end
end
