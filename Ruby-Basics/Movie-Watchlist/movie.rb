class Movie
  attr_accessor :title, :year, :watched

  def initialize(title, year, watched = false)
    @title = title
    @year = year
    @watched = watched
  end

  def to_s
    status = watched ? "Watched" : "Not watched"
    "#{title} (#{year}) - #{status}"
  end

  def to_h
    {
      title: @title,
      year: @year,
      watched: @watched
    }
  end

  def self.from_h(hash)
    new(hash['title'], hash['year'], hash['watched'])
  end
end