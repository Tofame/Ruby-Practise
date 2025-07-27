require 'socket'

port = 9000
server = TCPServer.new port
puts "Server opened on port: #{port}"

clients = []
clients_mutex = Mutex.new

def add_client(clients, mutex, client)
  mutex.synchronize { clients << client }
end

def remove_client(clients, mutex, client, client_name)
  mutex.synchronize { clients.delete(client) }
  announce_to_everyone(clients, mutex, "#{client_name} has left the chat.")
  client.close
end

def announce_to_everyone(clients, mutex, text)
  mutex.synchronize do
    clients.each do |client|
      begin
        client.puts text
      rescue IOError
        # I should probably remove client from clients here?
        remove_client(clients, mutex, client, "Chat user")
      end
    end
  end
end

def handle_client(clients, mutex, client)
  client_name = client.gets&.chomp
  return unless client_name

  add_client(clients, mutex, client)

  client.puts "You have joined the chat, #{client_name}! Clients connected: #{clients.size}"
  announce_to_everyone(clients, mutex, "#{client_name} joined the chat!")

  begin
    while line = client.gets
      message = line.chomp
      announce_to_everyone(clients, mutex, "#{client_name}: #{message}")
    end
  rescue => e
    puts "Error with client '#{client_name}': #{e.message}"
  ensure
    remove_client(clients, mutex, client, client_name)
  end
end

# Server loop
loop do
  client = server.accept
  Thread.new do
    handle_client(clients, clients_mutex, client)
  end
end