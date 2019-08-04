require 'open-uri'
require "nokogiri"

class Restaurants

  # path = "https://www.yelp.com/search?cflt=burgers&find_loc=Downtown%2C+Baltimore%2C+MD"

  # Div = lemon--div__373c0__1mboc border-color--default__373c0__2xHhl
  # LI = lemon--li__373c0__1r9wz border-color--default__373c0__2oFDT

  doc = Nokogiri::HTML(open("https://foursquare.com/top-places/baltimore/best-places-burgers"))

  @@all = {}

  def initialize
    puts "This is a test"
    # doc.css("p.venueName a").text.each do |restaurant|
    #   puts "- #{restaurant}"
    # end
  end

  # Resaurant Name: doc.css("p.venueName a").first.text

  # doc.css("p.venueName").each do |x|
  # array << x.text
  # end

  # y = array[0].text.split(". ")
  # ["1", "Abbey Burger Bistro"]
  # y.shift

  # Rating: doc.css("div.rating").first.text
  # Restaurant Page URL: doc.css("a.venueLink").first.attribute("href").value (needs fourquare.com added first)
  # On a given restaurant page, get the street address: doc.css("div.adr span").children.text
  # Phone:  doc.css("span.tel").text
  # Web URL: doc.css("a.url").attribute("href").value
  # Cost out of 4: doc.css("span.darken").text (will return $$ out of $$$$)
  # Neighborhood: tipCount
  # Meta: doc.css("div.meta.adjusted").first.text (category, Neighborhood and number of tips)



  def pull

  end
end
