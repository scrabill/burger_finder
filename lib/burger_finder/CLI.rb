class CLI

attr_accessor :name

  def initialize(name = nil)

    puts "Hi! What's your name?"
    @name = gets.chomp
    puts "Alright, #{@name}. Here are the burger restaurants available in your area."

    start

  end

  def start

    Restaurants.list_burgers

    menu

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
