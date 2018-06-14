require 'pry'
class TeslaModels::Model

  attr_accessor :name, :availability, :price, :url, :acceleration_speed, :horsepower, :top_speed

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  # def scraper
  #   doc = Nokogiri::HTML(open("https://www.caranddriver.com/tesla"))
  #   doc.search(".car-card").each do |card|
  #     model = card.search(".car-model")
  #     url = card.serach(".car-link")
  #
  #     car_page = Nokogiri::HTML(open(url))
  #     speed = car_page.search(".car-speed")
  #
  #     Car.new(model, speed)
  #   end
  # end

  def self.scrape_all
    models = []
    #models << self

    doc = Nokogiri::HTML(open("https://www.caranddriver.com/tesla"))
    doc.search("h2 a").each do |title|
      model = self.new(name)
      model.name = title.attributes["title"].value
      main_url = "https://www.caranddriver.com#{ title.attributes["href"].value }"
      model.url = main_url
      model.availability = true
      page = Nokogiri::HTML(open(main_url))
      model.price = page.search(".mb2")[1].text
      model.acceleration_speed = page.search(".f20")[0].text#{}"#{"sec"}"
      model.horsepower = page.search(".f20")[1].text
      model.top_speed = page.search(".f20")[2].text

      models.push(model)
      binding.pry
      #model.price = title.search("div .flex-shrink-none").first.children[1].text
    end
  models
  binding.pry

    # name= doc.search("h2 a").first.attributes["title"].value
    # price = doc.search("div .flex-shrink-none").first.children[1].tex





    # name =
    # price =
    # url =
    # acceleration_speed =
    # horsepower =
    # top_speed =


    #
    # models
    #
    #
    #
    # model_1 = self.new
    # model_1.name = "Model 3"
    # model_1.availability = true
    # model_1.price = "$36,000"
    # model_1.url = "https://www.caranddriver.com/tesla/model-3"
    #
    # model_2 = self.new
    # model_2.name = "Model S"
    # model_2.availability = true
    # model_2.price = "$75,700"
    # model_2.url = "https://www.caranddriver.com/tesla/model-s"
    #
    # model_3 = self.new
    # model_3.name = "Model X"
    # model_3.availability = true
    # model_3.price = "$80,700"
    # model_3.url = "https://www.caranddriver.com/tesla/model-x"
    #
    # model_4 = self.new
    # model_4.name = "Roadster"
    # model_4.availability = false
    # model_4.price = " "
    # model_4.url = "https://www.caranddriver.com/tesla/roadster"
    #
    # [model_1, model_2, model_3, model_4]

  end

end
