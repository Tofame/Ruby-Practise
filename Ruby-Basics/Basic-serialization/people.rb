require_relative 'person'
require_relative 'person_serializer'

filename = File.join(__dir__, "person.bin")
person = Person.new(health: 76, age: 30, name: "Józef", surname: "Kowalski", stamina: 75)

File.open(filename, "wb") do |file|
  file.write(PersonSerializer.serialize(person))
end
puts "Person saved to #{filename}"

loaded_data = File.open(filename, "rb") { |file| file.read }
loaded_person = PersonSerializer.deserialize(loaded_data)


puts "Loaded person:"
#puts loaded_person.name

# p is like puts, but it is actually displaying the data in its literal form
#<Person:0x000001f1c8002ee8 @health=100, @age=30, @name="Józef", @surname="Kowalski", @stamina=75>
p loaded_person