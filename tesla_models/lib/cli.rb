class TeslaModels::CLI

  def call
    puts "Welcome to my the Tesla World!"
    list_models
    menu
    goodbye
  end

  def list_models
    puts "Here is the list of Tesla Models:"
    @models = TeslaModels::Model.all
    @models.each.with_index(1) do |model, i|
      puts "#{i}. #{model.name} - #{model.price} - #{model.availability}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the model you would like to to know more about or type list to see the models or type exit to exit:"
      input = gets.strip.downcase
        if input.to_i > 0
          the_model = @models[input.to_i-1]
          puts "#{the_model.name} - #{the_model.price} - #{the_model.availability}"
        elsif input == "list"
          list_models
        elsif input == "exit"
          break
        else
          puts "Invalid entry. Please, type list to see the list of models."
        end
    end
  end


  def goodbye
    puts "Thank you for visiting us! GoodBye!"
  end

end
