require 'socket'

socket = TCPSocket.new('localhost', 9000)
puts "Connected to server."

loop do
  print "Enter number, 'count' or 'exit': "
  input = gets.chomp

  socket.puts input

  response = socket.gets
  break if response.nil? # server closed connection

  puts "Server says: #{response}"

  break if input.downcase == 'exit'
end

socket.close
puts "Disconnected."