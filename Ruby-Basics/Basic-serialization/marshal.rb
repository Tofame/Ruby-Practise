def write_data
  data = { name: "Józef", age: 20 }
  bytes = Marshal.dump(data)
  filename = File.join(__dir__, "data.bin")
  File.open(filename, "wb") { |f| f.write(bytes) }
  puts "Data saved to #{filename}"
end

def read_data
  filename = File.join(__dir__, "data.bin")
  if File.exist?(filename)
    bytes = File.open(filename, "rb") { |f| f.read }
    data = Marshal.load(bytes)
    puts "Read data: #{data.inspect}"
  else
    puts "File not found: #{filename}"
  end
end

def main
  puts "Choose action:\n1 - Write Data\n2 - Read Data"
  choice = gets.chomp

  case choice
  when "1"
    write_data
  when "2"
    read_data
  else
    puts "Invalid choice"
  end
end

if __FILE__ == $0
  main
end
