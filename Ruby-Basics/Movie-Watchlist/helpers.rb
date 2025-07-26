module Helpers
  def get_rating_from_user(min: 0, max: 10)
    loop do
      print "Enter a rating (#{min} to #{max}): "
      input = gets.chomp

      rating = Float(input) rescue nil

      if rating && rating >= min && rating <= max
        return rating
      else
        puts "Invalid input. Please enter a number between #{min} and #{max}."
      end
    end
  end
end