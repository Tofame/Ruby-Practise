require 'socket'

port = 9000

begin
  socket = TCPSocket.new('localhost', port)
  puts 'Connected to the server.'
rescue Errno::ECONNREFUSED
  puts "Failed to connect: Server is unreachable (port: #{port})."
  exit
rescue SocketError => e
  puts "Socket error: #{e.message}"
  exit
rescue => e
  puts "Unexpected error: #{e.message}"
  exit
end

puts "Choose the name you will use in the chat:"
name = gets.chomp

socket.puts "#{name}"

def local_typing socket
  loop do
    print "(me)> "
    text_to_send = gets.chomp
    socket.puts text_to_send
  end
end

def receive_from_server socket
  while line = socket.gets
    puts line
  end
end


lt = Thread.new { local_typing(socket) }
rfs = Thread.new { receive_from_server(socket) }

lt.join
rfs.join

socket.close