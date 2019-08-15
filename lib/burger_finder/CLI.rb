class BurgerFinder::CLI

attr_accessor :name

  def initialize(name = nil)

    puts "Hi! What's your name?"
    puts "\n"

    @name = gets.chomp
    puts "\n"

    BurgerFinder::Restaurants.create_restaurant

    start

  end

  def start

    puts "Would you like to see a list of burger restuarants in your area? Enter Y or N to exit"
    puts "\n"

    input = gets.chomp.upcase

    case input

    when "Y"
        puts "\n"
        puts "Alright, #{@name}. Here is a list of burger restaurants nearby."
        puts "\n"

        BurgerFinder::Restaurants.list_burgers

        puts "To learn more about a restaurant, enter it's number or N to exit"
        puts "\n"

        input = gets.chomp
        puts "\n"

        if input == "N"
          puts "Ok, #{@name} maybe next time!"
          puts "\n"
        else
          input = input.to_i

          if input <= 15
            BurgerFinder::Restaurants.details(input)
            puts "\n"
            start
          else
            puts "I'm sorry, I do not understand that command."
            puts "\n"
            start
          end

        end

    when "N"
        puts "\n"
        puts "Ok, #{@name} maybe next time!"
        puts "\n"
    else
      puts "\n"
      puts "I'm sorry, I do not understand that command."
      puts "\n"
      start
    end

  end

end
