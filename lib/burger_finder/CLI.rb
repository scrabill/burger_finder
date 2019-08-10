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

  # puts "Alright, #{@name}. Where do you want to search? Please enter a zip code."
  # @zip = gets.chomp
  puts "Alright, #{@name}. Here are the burger restaurants available in your area."

  Restaurants.list_burgers

  menu
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

  def menu
    input = nil
    while input == nil

    puts "To learn more about a restaurant, enter it's number"

    input = gets.chomp

      if input.to_i > Restaurants.all.length
        puts "I'm sorry, I did not understand your input"
        # input = gets.chomp.to_i
        menu
      elsif input.to_i <= Restaurants.all.length
        input = input.to_i
        Restaurants.details(input)
      else
        puts "I'm sorry, I did not understand your input. Please enter a number between 1-15"
      end

    end

  end

end
