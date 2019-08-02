require_relative './restaurants.rb'
require "pry"

class CLI

attr_accessor :name, :see_burgers, :zip

def initialize(name = nil, see_burgers = nil, zip = nil)
  # start
  puts "Hi! What's your name?"
  @name = gets.chomp

  # puts "Hi #{@name}. Would you like to see a list of burger joints in Baltimore? y/n"
  # @see_burgers = gets.chomp

  puts "Alright, #{@name}. Where do you want to search? Please enter a zip code."
  @zip = gets.chomp
end

  # def initialize
  #   # start
  #   greeting
  #   self.name = name
  #   self.see_burgers = see_burgers
  #   self.zip = zip
  # end

  def greeting
    # name = nil
    # see_burgers = nil
    # zip = nil

    # until
      name != nil
      puts "Hi! What's your name?"
      name = gets.chomp

      puts "Hi #{name}. Would you like to see a list of burger joints in Baltimore? y/n"
      see_burgers = gets.chomp

      puts "Alright, #{name}. Where do you want to search? Please enter a zip code."
      zip = gets.chomp
    # end



    # if zip != nil
    #   Restaurants.test()
    # else
    #   puts "ok, no burgs for you"
    # end
  end

  # binding.pry

end
