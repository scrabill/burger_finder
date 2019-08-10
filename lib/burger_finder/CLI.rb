class CLI

attr_accessor :name

  def initialize(name = nil)

    puts "Hi! What's your name?"
    @name = gets.chomp

    start

  end

  def start
    
    puts "Would you like to see a list of burger restuarants in your area? Enter Y or N to exit"
    input = gets.chomp

    if input == "Y"

      puts "Alright, #{@name}. Here are the burger restaurants available in your area."
      puts "\n"

      Restaurants.list_burgers
      puts "\n"

      puts "To learn more about a restaurant, enter it's number or N to exit"
      puts "\n"

      input = gets.chomp

        if input != "N"
          input = input.to_i
          Restaurants.details(input)
          puts "\n"
          start
        else
          puts "Ok, maybe next time!"
          puts "\n"
        end

    elsif input == "N"
      puts "Ok, maybe next time!"
      puts "\n"
    end

  end

end
