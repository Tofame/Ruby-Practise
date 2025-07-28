# Initial symbol understanding:
# Something like an iteral, instead of making strings that are each time
# a new object which is memory costly, use iteral

# It is not a literal though.

# A Symbol is an immutable, reusable name/identifier, so it comes in hand as e.g. indentifier
puts "TEST SYMBOLS AS KEYs"
person = {
  name: "Józef", # symbol
  "age": 30, # still a symbol due to :
  "iq" => 100, # string
  :email => "jozef@example.com" # same as      email: "jozef@example.com"
}

puts person[:name]  # => "Józef"

puts person[:age]   # => 30
puts person["age"]   # => nil

puts person[:iq]   # nil
puts person["iq"]   # nil

# Two conclusions:
# Ruby has sugar syntax which is even when we do "age", because we used ':' Ruby automatically turns that into
# a Symbol, so "age" indexing won't work.
# So we always want to use Symbols basically, but we can still use strings, its just we have to use => then.

# Id
puts "\nID CHECK"
puts "name".object_id == "name".object_id     # => false
puts :name.object_id == :name.object_id       # => true

# Conversion. Though I think it is dynamic conversion and might be dangerous?
# puts "\nCONVERSION"
# sym = :username
# str = "password"
#
# puts sym.to_s     # => "username"
# puts str.to_sym   # => :password

# Methods
puts "\nIN METHODS"
def greet(name:, age:)
  puts "Hello #{name}, age #{age}."
end

greet(name: "Józef", age: 30)