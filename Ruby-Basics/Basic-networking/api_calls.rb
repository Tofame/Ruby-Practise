require 'net/http'
require 'json'

url = URI("https://api.github.com/repos/ruby/ruby")
response = Net::HTTP.get(url)
data = JSON.parse(response)

topics = data['topics']

puts "Lets print topics from ruby repo"
topics.each_with_index do |topic, index|
  puts topic
end