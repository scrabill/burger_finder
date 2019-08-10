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
    # puts "Good Burger - $$"
    #
    # Restaurants.new("Good Burger", "8,7", "$$", "Brooklyn", "https://en.wikipedia.org/wiki/Good_Burger")
    # Restaurants.new("Burger Kind", "3.4", "$", "Ocean City", "https://en.wikipedia.org/wiki/Good_Burger")
    # Restaurants.new("Bobby's Burger Palace", "9,9", "$$$", "Baltmore", "https://en.wikipedia.org/wiki/Good_Burger")


    # puts "#{restaurant1.name} - #{restaurant1.rating} - #{restaurant1.cost} - #{restaurant1.neighborhood}"
    # puts "#{restaurant2.name} - #{restaurant2.rating} - #{restaurant2.cost} - #{restaurant2.neighborhood}"
    # puts "#{restaurant3.name} - #{restaurant3.rating} - #{restaurant3.cost} - #{restaurant3.neighborhood}"

    # p restaurant1.name

    # @@all.uniq.each_with_index do |restaurant,i|
    #   puts "#{i+1} -- #{restaurant.name} - #{restaurant.rating} - #{restaurant.cost} - #{restaurant.neighborhood}"
    # end

    Scraper.scrape_main_page

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
