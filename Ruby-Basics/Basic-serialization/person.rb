class Person
  attr_accessor :health, :age, :name, :surname, :stamina

  def initialize(health:, age:, name:, surname:, stamina:)
    @health = health
    @age = age
    @name = name
    @surname = surname
    @stamina = stamina
  end
end