class CLI

attr_accessor :name

  def initialize(name = nil)

    puts "Hi! What's your name?"
    @name = gets.chomp

    start

  end

  def start

    # Show the list of all restaurants
    # Ask which restaurant they would like more info on
    # Display the details for that restaurant
    puts "Would you like to see a list of burger restuarants in your area? Enter Y or N to exit"
    input = gets.chomp

    if input == "Y"

      puts "Alright, #{@name}. Here are the burger restaurants available in your area."
      puts "\n"

      Restaurants.list_burgers
      puts "\n"

      menu
    elsif input == "N"
      puts "Ok, maybe next time!"
      puts "\n"
    end


  end

  def menu

    puts "To learn more about a restaurant, enter it's number or E to exit"
    puts "\n"

    input = gets.chomp

    if input == "E"
      puts "Goodbye!"
      puts "\n"
      exit
    else
      input = input.to_i
      Restaurants.details(input)
      puts "\n"
      start
    end

  end

end
