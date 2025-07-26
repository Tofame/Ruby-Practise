require_relative 'helpers.rb'
require_relative 'watchlist.rb'

module Commands
  def self.list_movies(watchlist)
    if watchlist.size <= 0
      puts "\nNo movies to show - first add some!"
      return
    end

    # Choose filter
    filter = nil
    loop do
      puts "\nFilter movies:"
      puts "1. All"
      puts "2. Watched"
      puts "3. Unwatched"
      print "Choose filter (1-3): "
      choice = gets.chomp

      case choice
      when '1'
        filter = :all
        break
      when '2'
        filter = :watched
        break
      when '3'
        filter = :unwatched
        break
      else
        puts "Invalid choice. Please try again."
      end
    end

    # Choose sorting
    sort_by = nil
    descending = false
    loop do
      puts "\nSort movies by:"
      puts "1. None"
      puts "2. Rating (Highest to Lowest)"
      puts "3. Rating (Lowest to Highest)"
      print "Choose sorting (1-3): "
      choice = gets.chomp

      case choice
      when '1'
        sort_by = nil
        break
      when '2'
        sort_by = :rating
        descending = true
        break
      when '3'
        sort_by = :rating
        descending = false
        break
      else
        puts "Invalid choice. Please try again."
      end
    end

    print("\n")
    watchlist.list_movies(filter: filter, sort_by: sort_by, descending: descending)
  end

  def self.add_movie(watchlist)
    loop do
      print 'Enter movie title: '
      title = gets.chomp.strip
      if title.empty?
        puts "Title can't be empty. Try again."
        next
      end

      print 'Enter movie year: '
      year_input = gets.chomp
      year = year_input.to_i

      if year_input.empty? || year <= 1800 || year > Time.now.year
        puts "Please enter a valid year between 1801 and #{Time.now.year}."
        next
      end

      watchlist.add_movie(title, year)
      puts "'#{title}' added."
      break
    end
  end

  def self.edit_movie(watchlist)
    if watchlist.size <= 0
      puts "\nNo Movies to edit!"
      return
    end

    puts "\nAll Movies to edit:"
    watchlist.list_movies(filter: :all)
    print "\nEnter the movie number to edit: "
    index = gets.chomp.to_i

    if index < 1 || index > watchlist.size
      puts 'Invalid movie number.'
      return
    end

    puts "\nEdit Options:"
    puts '1. Remove Movie'
    puts '2. Mark as Watched'
    puts '3. Mark as Unwatched'
    puts '4. Rate the movie'
    print 'Choose an option: '
    edit_choice = gets.chomp

    case edit_choice
    when '1'
      if watchlist.remove_movie(index)
        puts 'Movie removed.'
      else
        puts 'Failed to remove movie.'
      end

    when '2'
      if watchlist.mark_watched_status(index, true)
        puts 'Movie marked as watched.'
      else
        puts 'Failed to update status.'
      end

    when '3'
      if watchlist.mark_watched_status(index, false)
        puts 'Movie marked as unwatched.'
      else
        puts 'Failed to update status.'
      end

    when '4'
      rating = Helpers.get_rating_from_user(0, 10)
      watchlist.rate_movie(index, rating)

    else
      puts 'Invalid edit option.'
    end
  end
end