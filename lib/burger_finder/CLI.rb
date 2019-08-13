class CLI

attr_accessor :name

  def initialize(name = nil)

    puts "Hi! What's your name?"
    @name = gets.chomp

    Restaurants.create_restaurant

    start

  end

  def start

    puts "Would you like to see a list of burger restuarants in your area? Enter Y or N to exit"
    puts "\n"

    input = gets.chomp.upcase

    case input

    when "Y"
        puts "Alright, #{@name}. Here is a list of burger restaurants nearby."
        puts "\n"

        Restaurants.list_burgers

        puts "To learn more about a restaurant, enter it's number or N to exit"
        puts "\n"

        input = gets.chomp

        if input == "N"
          puts "Ok, #{@name} maybe next time!"
          puts "\n"
        else
          input = input.to_i

          if input <= 15
            Restaurants.details(input)
            puts "\n"
            start
          else
            puts "I'm sorry, I do not understand that command."
            puts "\n"
            start
          end

        end

    when "N"
        puts "Ok, #{@name} maybe next time!"
        puts "\n"
    else
      puts "I'm sorry, I do not understand that command."
      puts "\n"
      start
    end

  end

end
