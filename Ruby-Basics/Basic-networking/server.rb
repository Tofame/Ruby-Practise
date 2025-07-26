require 'socket'

port = 9000
server = TCPServer.new(port)
puts "Server started on port #{port}..."

sum = 0

loop do
  client = server.accept
  puts "Client connected."

  loop do
    msg = client.gets&.chomp
    break if msg.nil? # client disconnected

    puts "Received: #{msg}"

    case msg.downcase
    when "exit"
      client.puts "Goodbye!"
      break
    when "count"
      client.puts "Current sum is #{sum}"
    else
      begin
        num = Float(msg)
        sum += num
        client.puts "Added #{num}, new sum is #{sum}"
      rescue ArgumentError
        client.puts "Invalid input. Send numbers, 'count' or 'exit'."
      end
    end
  end

  puts "Client disconnected."
  client.close
end