class BurgerFinder::Scraper

  @@file = File.read("fixtures/The 15 Best Places for Burgers in Baltimore.htm")
  @@doc = Nokogiri::HTML(@@file)

  def self.scrape_main_page

    @@doc.css("div.venueInfo")

  end

  def self.scrape_detail_page(input)
    url = BurgerFinder::Restaurants.all[input].website
    doc = Nokogiri::HTML(open(url, 'User-Agent' => 'ruby'))
  end

end
