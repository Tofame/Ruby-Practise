require_relative 'movie'
require_relative 'watchlist'
require_relative 'commands'
require 'colorize'

watchlist = Watchlist.new
watchlist_file_path = File.join(__dir__, 'watchlist.json')
watchlist.load_from_file(watchlist_file_path)

def show_menu
  puts "\nMovie Watchlist Menu".colorize(:light_yellow)
  puts '1. List movies'.colorize(:yellow)
  puts '2. Add Movie'.colorize(:yellow)
  puts '3. Edit Movie'.colorize(:yellow)
  puts '4. Exit'.colorize(:yellow)
  print 'Choose an option: '.colorize(:light_yellow)
end

begin
  loop do
    show_menu

    choice = gets.chomp
    case choice
      when '1'
        Commands.list_movies(watchlist)

      when '2'
        Commands.add_movie(watchlist)

      when '3'
        Commands.edit_movie(watchlist)

      when '4'
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