require_relative 'movie'
require 'json'
class Watchlist
  def initialize
    @movies = []
  end

  def size
    @movies.size
  end

  def list_movies(filter: :all, sort_by: nil, descending: false)
    movies = case filter
             when :watched
               @movies.select(&:watched)
             when :unwatched
               @movies.reject(&:watched)
             else
               @movies
             end

    if sort_by == :rating
      movies = movies.sort_by { |m| m.rating || -1 } # for unrated use -1
      movies.reverse! if descending
    elsif sort_by == :year
      movies = movies.sort_by(&:year)
      movies.reverse! if descending
    else
      movies = movies.sort_by { |m| m.rating || -1 }
    end

    print_movies(movies)
    movies
  end

  def add_movie(title, year)
    @movies << Movie.new(title, year)
  end

  def remove_movie(index)
    return false if index < 1 || index > @movies.size
    @movies.delete_at(index - 1)
    true
  end

  def mark_watched_status(index, status)
    movie = @movies[index - 1]
    return false unless movie
    movie.watched = status
    true
  end

  def rate_movie(index, rating)
    movie = @movies[index - 1]
    return false unless movie
    movie.rating = rating
    true
  end

  def save_to_file(filename)
    data = @movies.map(&:to_h)
    File.write(filename, JSON.pretty_generate(data))
  end

  def load_from_file(filename)
    return unless File.exist?(filename)
    data = JSON.parse(File.read(filename))
    @movies = data.map { |movie_hash| Movie.from_h(movie_hash) }
  end

  private

  def print_movies(movies)
    movies.each_with_index do |movie, index|
      puts "#{index + 1}. #{movie}"
    end
  end
end