class Movie
  attr_accessor :title, :year, :watched, :rating

  def initialize(title, year, watched = false, rating = nil)
    @title = title
    @year = year
    @watched = watched
    @rating = rating
  end

  def to_s
    status = watched ? "Watched" : "Not watched"
    rating_str = rating.nil? ? "Unrated" : "Rating: #{rating}/10"
    "#{title} (#{year}) - #{status}, #{rating_str}"
  end

  def to_h
    {
      title: @title,
      year: @year,
      watched: @watched,
      rating: @rating
    }
  end

  def self.from_h(hash)
    new(hash['title'], hash['year'], hash['watched'], hash['rating'])
  end
end