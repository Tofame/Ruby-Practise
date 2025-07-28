# Mainly based on https://docs.ruby-lang.org/en/master/exceptions_md.html

begin
  raise 'Boom!'                # Raises an exception, transfers control.
  puts 'Will not get here.'
rescue
  puts 'Rescued an exception.' # Control transferred to here; program does not exit.
ensure
  puts 'No matter whether it crashed or not, this will run.'
end
puts 'Got here.'

# Retry keyword is very useful lol, its awesome. Allows to repeat the 'begin' section.
puts "--- RETRY"

retries = 0
begin
  puts "Try ##{retries}."
  raise 'Boom'
rescue
  puts "Rescued retry ##{retries}."
  if (retries += 1) < 3
    puts 'Retrying'
    retry
  else
    puts 'Giving up.'
    raise
  end
end