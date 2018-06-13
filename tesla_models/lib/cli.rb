class TeslaModels::CLI

  def call
    puts "Welcome to my the Tesla World!"
    list_models
    menu
    goodbye
  end

  def list_models
    puts <<-DOC.gsub /^\s*/, ''
    1. Model 3 - Available - $36,000
    2. Model S - Available - 75,700
    3. Model X - Available - 80,700
    4. Roadster - Not Available
    DOC
  end

  def menu

    input = nil
    while input != "exit"
      puts "Enter the number of the model you would like to to know more about or type list to see the models or type exit to exit:"
      input = gets.strip.downcase
      case input
      when "1"
        puts "More about Model 3"
      when "2"
        puts "More about Model S"
      when "3"
        puts "More about Model X"
      when "4"
        puts "More about Roadster"
      when "list"
        list_models
      else
        puts "Invalid entry. Please, type list to see the list of models."
      end
    end
  end

  def goodbye
    puts "Thank you for visiting us! GoodBye!"
  end

end
