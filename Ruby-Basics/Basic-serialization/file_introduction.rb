# Good docs: https://docs.ruby-lang.org/en/master/File.html

filename = File.join(__dir__, "data.txt")
if File.exist?(filename)
  puts "#{filename} exists."
else
  puts "#{filename} does not exist."
end

# Current working dir
puts Dir.pwd

# Good docs: https://docs.ruby-lang.org/en/master/File.html
# Notes
# File may be read anywhere; see IO#rewind, IO#pos=, IO#seek:
# f.pos allows for moving across the file's stream
# I think needs to be used with? f.lineno   # => 0?
# 'rewind' method just does both - setting both the position and the line number to zero

# foreach(path, sep, limit, **opts) {|line| block } → nil
File.foreach(filename, 20) {|line| p line }
# The limit is not limit of lines, it is limit of buffer it reads at a time.
# So for limit 7, it just reads 7 bytes at once, but you still are gonna get everything


print "\n\nBetter Chunk testing\n"
File.open(filename, "rb") do |f|
  while chunk = f.read(7)
    puts "Chunk: #{chunk.inspect}"
  end
end