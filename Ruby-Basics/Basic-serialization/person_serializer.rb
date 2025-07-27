class PersonSerializer
  def self.serialize(person)
    name_bytes = person.name.encode("UTF-8").b
    surname_bytes = person.surname.encode("UTF-8").b

    [
      person.health,
      person.age,
      name_bytes.bytesize,
      surname_bytes.bytesize,
      person.stamina
    ].pack("CCCCC") + name_bytes + surname_bytes
  end

  def self.deserialize(data)
    health, age, name_len, surname_len, stamina = data[0,5].unpack("CCCCC")
    name_start = 5
    name_end = name_start + name_len - 1
    surname_start = name_end + 1
    surname_end = surname_start + surname_len - 1

    name = data[name_start..name_end].force_encoding("UTF-8")
    surname = data[surname_start..surname_end].force_encoding("UTF-8")

    Person.new(
      health: health,
      age: age,
      name: name,
      surname: surname,
      stamina: stamina
    )
  end
end