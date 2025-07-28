require 'net/http'
# Using https://docs.ruby-lang.org/en/master/Net/HTTP.html

uri = URI('https://jsonplaceholder.typicode.com/')
uri.freeze # Examples may not modify.
hostname = uri.hostname # => "jsonplaceholder.typicode.com"
path = uri.path         # => "/"
port = uri.port         # => 443

Net::HTTP.get(uri)
Net::HTTP.get(hostname, '/index.html')
Net::HTTP.start(hostname) do |http|
  res1 = http.get('/todos/1')
  res2 = http.get('/todos/2')

  puts "Response 1: #{res1.body}"
  puts "Response 2: #{res2.body}"
end

# Without seession it is just less performant, if we do single request(s)
# Those responses are going to the website, so they would give me full html, which is too much xd
#ns_res1 = Net::HTTP.get_response(hostname, path)
#ns_res2 = Net::HTTP.get_response(uri)
#puts "Response 1: #{ns_res1.body}"
#puts "Response 2: #{ns_res2.body}"

# ----------- HEADERS
# headers = {Accept: 'application/json', Connection: 'Keep-Alive'}
# Net::HTTP.get(uri, headers)

# ------------ Session manually finished
puts "\n\n--- Manual Session"
http = Net::HTTP.new(hostname)
http.start
puts http.get('/todos/1').body
puts http.get('/todos/2').body
# If we wanted to use header
# puts http.get('/todos/1', headers).body
http.delete('/posts/1')
http.finish # Needed to free resources.


