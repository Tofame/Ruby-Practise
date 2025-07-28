# The inheritance in Ruby is normal, like 'extend' in Java for example.
# Ruby only supports single inheritance.
puts("---- Inheritance\n")
class Animal
  def speak
    "Generic sound"
  end
end

class Dog < Animal
  def speak
    "Woof!"
  end
end

dog = Dog.new
puts dog.speak # Woof!

# There is no Interfaces like in Java, however there are modules.
puts("\n\n---- Modules")

module Logger
  def log(msg)
    puts "[LOG] #{msg}"
  end
end

module Drivable
  def drive
    "Driving on land!"
  end
end

module Sailable
  def sail
    "Sailing on water!"
  end
end

class AmphibianCar
  include Drivable
  include Sailable

  def mode
    "I can handle both land and water!"
  end
end

car = AmphibianCar.new

puts car.mode
puts car.drive
puts car.sail
puts "Ancestors: #{AmphibianCar.ancestors}"

class App
  extend Logger # so extend is basically adding static methods. Include is for instances.
  def self.warning(message) # self -> static
    puts "[WARNING] #{message}"
  end
end
App.log("Starting...")
App.warning("Oh no...")

# Prepend is same as Include, but it's meant to override original methods.

# Modules can be treated as namespaces.
module Std
  def self.pretty_print
    puts "Pretty printed"
  end
end
Std::pretty_print()

module Animals
  class Dog
    def speak
      "Woof!"
    end
  end
end
dog = Animals::Dog.new
puts dog.speak