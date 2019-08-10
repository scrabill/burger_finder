require 'open-uri'
require "nokogiri"

class Scraper

  @@all = []

  @@file = File.read("fixtures/The 15 Best Places for Burgers in Baltimore.htm")
  @@doc = Nokogiri::HTML(@@file)


  def self.scrape_main_page

    venues = @@doc.css("div.venueInfo")
    venues.each do |venue|
      # puts venue.css("a.venueLink").text

      name = venue.css("a.venueLink").text
      rating = venue.css("span.venueScore span").text
      neighborhood = venues.css("span.tipCount").text.split(" · ")[1]
      website = venue.css("a.venueLink").attr("href").value
      venue = Restaurants.new(name, rating, neighborhood, website)
    end

    venues
  end

  def self.scrape_detail_page(input)
    input -= 1
    url = Restaurants.all[input].website
    doc = Nokogiri::HTML(open(url, 'User-Agent' => 'ruby'))

    puts "#{Restaurants.all[input].name} - #{Restaurants.all[input].rating}/10 - #{doc.css("span.darken").text}"
    puts "\n"

    puts "Address:"
    puts doc.css("div.adr span")[0].text
    puts "#{doc.css("div.adr span")[1].text} #{doc.css("div.adr span")[2].text} #{doc.css("div.adr span")[3].text}"
    puts "\n"

    puts "Phone:"
    puts doc.css("span.tel").text
    puts "\n"

    puts "Website:"
    puts doc.css("a.url").attribute("href").value
    puts "\n"

    puts "Popular Tip:"
    puts doc.css("div.tipText").first.text

  end

  def self.main_page
    Nokogiri::HTML(open("https://foursquare.com/explore?mode=url&near=90210&q=Burger"))
  end

  def self.all_results
    self.main_page.css("div.venueDetails").each do |x|
      puts x.text
    end
  end

  def self.make_restaurants
    self.all_results.each do |burger_joint|
      puts array = burger_joint.gsub(". "," • ").split(" • ")
      puts burger_joint.name = array[1]
      puts burger_joint.rating = array[0]
      puts burger_joint.location = array[1]
      puts "***"
    end
  end

  # attr_accessor :name, :see_burgers, :zip
  #
  # path = "https://foursquare.com/explore?mode=url&near=#{CLI.zip}&q=Burger"
  #
  # def initialize#(path)
  #   puts "test"
  # end
end
