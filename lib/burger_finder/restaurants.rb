class Restaurants

  attr_accessor :name, :rating, :neighborhood, :website

  @@all = []

  def initialize(name = nil, rating = nil, neighborhood = nil, website = nil)

    @name = name
    @rating = rating
    @neighborhood = neighborhood
    @website = website

    @@all << self

  end

  def self.create_restaurant

    Scraper.scrape_main_page.each do |venue|

      name = venue.css("a.venueLink").text
      rating = venue.css("span.venueScore span").text
      neighborhood = venue.css("span.tipCount").text.split(" · ")[1]
      website = venue.css("a.venueLink").attr("href").value
      venue = Restaurants.new(name, rating, neighborhood, website)

    end

  end

  def self.all
    @@all
  end

  def self.list_burgers

    Restaurants.all.each do |restaurant|
      puts restaurant.name
    end
    puts "\n"

  end

  def self.details(input)

    doc = Scraper.scrape_detail_page(input)

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
    puts "\n"

  end

end
