class Restaurants

  attr_accessor :name, :rating, :neighborhood, :website

  file = File.read('fixtures/The 15 Best Places for Burgers in Baltimore.htm')
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
    @neighborhood = neighborhood
    @website = website

    @@all << self

  end

  def self.all
    @@all
  end

  def self.details(input)
    Scraper.scrape_detail_page(input)
  end
  
end
