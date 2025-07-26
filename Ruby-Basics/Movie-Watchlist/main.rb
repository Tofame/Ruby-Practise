require_relative 'movie'
require_relative 'watchlist'
require_relative 'commands'

watchlist = Watchlist.new
watchlist_file_path = File.join(__dir__, 'watchlist.json')
watchlist.load_from_file(watchlist_file_path)

def show_menu
  puts "\nMovie Watchlist Menu"
  puts '1. Show all movies'
  puts '2. Show watched movies'
  puts '3. Show unwatched movies'
  puts '4. Add Movie'
  puts '5. Edit Movie'
  puts '6. Exit'
  print 'Choose an option: '
end

begin
  loop do
    show_menu

    choice = gets.chomp
    case choice
    when '1'
        puts "\nAll Movies:"
        watchlist.list_movies

      when '2'
        puts "\nWatched Movies:"
        watchlist.list_watched_movies

      when '3'
        puts "\nUnwatched Movies:"
        watchlist.list_unwatched_movies

      when '4'
        Commands.add_movie(watchlist)

      when '5'
        Commands.edit_movie(watchlist)

      when '6'
        puts 'Goodbye!'
        break

      else # There is 'else' in ruby, which equals to 'default:' in other languages.
        puts 'Invalid option, try again.'
    end
  end
rescue Interrupt
  puts "\nProgram interrupted. Saving watchlist before exit..."
ensure
  watchlist.save_to_file(watchlist_file_path)
  puts "Watchlist has been saved!"
end