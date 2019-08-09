require "nokogiri"
require "open-uri"
require "pry"

module BurgerFinder
  class Error < StandardError; end
  # Your code goes here...
end

require_relative "./burger_finder/version"
require_relative "./burger_finder/CLI"
require_relative "./burger_finder/restaurants"
require_relative "./burger_finder/scraper"
