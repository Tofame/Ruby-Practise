# https://docs.ruby-lang.org/en/master/ERB.html
# Here actually usage of ERB for purposes not related to HTML, but using the
# fact it is in fact a powerful template system.

require "erb"

# build data class
class Listings
  PRODUCT = { :name => "Chicken Fried Steak",
              :desc => "A well messaged pattie, breaded and fried.",
              :cost => 9.95 }

  attr_reader :product, :price

  def initialize( product = "", price = "" )
    @product = product
    @price = price
  end

  def build
    b = binding
    # create and run templates, filling member data variables
    ERB.new(<<~'END_PRODUCT', trim_mode: nil, eoutvar: "@product").result b
      <%= PRODUCT[:name] %>
      <%= PRODUCT[:desc] %>
    END_PRODUCT
    ERB.new(<<~'END_PRICE', trim_mode: nil, eoutvar: "@price").result b
      <%= PRODUCT[:name] %> -- <%= PRODUCT[:cost] %>
      <%= PRODUCT[:desc] %>
    END_PRICE
  end
end

# setup template data
listings = Listings.new
listings.build

puts listings.product + "\n" + listings.price