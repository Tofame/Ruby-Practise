module Commands
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
    watchlist.list_movies
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

    else
      puts 'Invalid edit option.'
    end
  end
end