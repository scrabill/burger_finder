require 'open-uri'
require "nokogiri"

class Restaurants

attr_accessor :name, :rating, :neighborhood, :website

  # path = "https://www.yelp.com/search?cflt=burgers&find_loc=Downtown%2C+Baltimore%2C+MD"

  # Div = lemon--div__373c0__1mboc border-color--default__373c0__2xHhl
  # LI = lemon--li__373c0__1r9wz border-color--default__373c0__2oFDT

  # doc = Nokogiri::HTML(open("https://foursquare.com/top-places/baltimore/best-places-burgers"))
  # doc = Nokogiri::HTML(open("../../fixtures/The 15 Best Places for Burgers in Baltimore.htm"))
  #
  # doc = Nokogiri::HTML(File.open("fixtures/test.htm"))

  file = File.read('fixtures/test.htm')
  doc = Nokogiri::HTML(file)

  @@all = []

  def self.list_burgers
    Scraper.scrape_main_page

    Restaurants.all.each do |restaurant|
      puts restaurant.name
    end

  end

  def initialize(name = nil, rating = nil, neighborhood = nil, website = nil)

    @name = name
    @rating = rating
    # @cost = cost
    @neighborhood = neighborhood
    @website = website
    # self.name = "Good Burger"
    # self.rating = "8.7"
    # self.cost = "$$"
    # self.neighborhood = "Brooklyn"
    # self.website = "https://en.wikipedia.org/wiki/Good_Burger"

    @@all << self





    # puts "This is a test"
    # doc.css("p.venueName a").text.each do |restaurant|
    #   puts "- #{restaurant}"
    # end
  end

  def self.all
    @@all
  end

  def self.details(input)
    puts "Here are more details about restaurant #{}#{input}"
    Scraper.scrape_detail_page(input)

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

end
