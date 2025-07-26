require_relative 'movie'
require 'json'
class Watchlist
  def initialize
    @movies = []
  end

  def size
    @movies.size
  end

  def list_movies
    sorted = @movies.sort_by { |movie| movie.watched ? 1 : 0 }
    print_movies(sorted)
    sorted
  end

  def list_unwatched_movies
    unwatched = @movies.select { |movie| !movie.watched }
    print_movies(unwatched)
    unwatched
  end

  def list_watched_movies
    watched = @movies.select { |movie| movie.watched }
    print_movies(watched)
    watched
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
      status = movie.watched ? "Watched" : "Not watched"
      puts "#{index + 1}. #{movie.title} (#{movie.year}) - #{status}"
    end
  end
end