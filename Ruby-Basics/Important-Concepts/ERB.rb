# https://docs.ruby-lang.org/en/master/ERB.html
# ERB is powerful templating system for Ruby.
# It is not limited to, however especially useful in HTML
# I would say it's similar to what I've done recently for my Go project
# where I had used Go's template engine to get dynamic HTML. This does the thing as well.
require 'erb'

x = 42
template = ERB.new <<-EOF
  The value of x is: <%= x %>
EOF
puts template.result(binding)

puts "\n\n"

# Create template.
template = %q{
  From:  James Edward Gray II <james@grayproductions.net>
  To:  <%= to %>
  Subject:  Addressing Needs

  <%= to[/\w+/] %>:

  Just wanted to send a quick note assuring that your needs are being
  addressed.

  I want you to know that my team will keep working on the issues,
  especially:

  <%# ignore numerous minor requests -- focus on priorities %>
  % priorities.each do |priority|
    * <%= priority %>
  % end

  Thanks for your patience.

  James Edward Gray II
}.gsub(/^  /, '')

message = ERB.new(template, trim_mode: "%<>")

# Set up template data.
to = "Community Spokesman <spokesman@ruby_community.org>"
priorities = [ "Run Ruby Quiz",
               "Document Modules",
               "Answer Questions on Ruby Talk" ]

# Produce result.
email = message.result
puts email