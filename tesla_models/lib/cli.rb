class TeslaModels::CLI
  def call
    puts "Welcome to my the Tesla World!"
    list_models
  end

  def list_models
    puts <<-DOC
    1. Model 3 - Available - $36,000
    2. Model S - Available - 75,700
    3. Model X - Available - 80,700
    4. Roadster - Not Available
    DOC
  end

end
