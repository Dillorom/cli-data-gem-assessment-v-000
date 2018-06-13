class TeslaModels::Model

  attr_accessor :name, :availability, :price, :url

  def self.all
    # should return all models
    puts <<-DOC.gsub /^\s*/, ''
    1. Model 3 - Available - $36,000
    2. Model S - Available - $75,700
    3. Model X - Available - $80,700
    4. Roadster - Not Available
    DOC

    model_1 = self.new
    model_1.name = "Model 3"
    model_1.availability = true
    model_1.price = "$36,000"
    model_1.url = "https://www.caranddriver.com/tesla/model-3"

    model_2 = self.new
    model_2.name = "Model S"
    model_2.availability = true
    model_2.price = "$75,700"
    model_2.url = "https://www.caranddriver.com/tesla/model-s"

    model_3 = self.new
    model_3.name = "Model X"
    model_3.availability = true
    model_3.price = "$80,700"
    model_3.url = "https://www.caranddriver.com/tesla/model-x"

    model_4 = self.new
    model_4.name = "Roadster"
    model_4.availability = false
    model_4.price = " "
    model_4.url = "https://www.caranddriver.com/tesla/roadster"

    [model_1, model_2, model_3, model_4]

  end

end
