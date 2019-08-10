class Restaurants

  attr_accessor :name, :rating, :neighborhood, :website

  file = File.read('fixtures/The 15 Best Places for Burgers in Baltimore.htm')
  doc = Nokogiri::HTML(file)

  @@all = []

  def initialize(name = nil, rating = nil, neighborhood = nil, website = nil)

    @name = name
    @rating = rating
    @neighborhood = neighborhood
    @website = website

    @@all << self

  end

  def self.all
    @@all
  end

  def self.list_burgers
    
    Restaurants.all.each do |restaurant|
      puts restaurant.name
    end

  end

  def self.details(input)
    Scraper.scrape_detail_page(input)
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

end
