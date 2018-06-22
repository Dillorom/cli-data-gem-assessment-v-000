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

  def self.scrape_all
    models = []

    doc = Nokogiri::HTML(open("https://www.caranddriver.com/tesla"))
    doc.search("h2 a").each do |title|
      model = self.new(name)
      model.name = title.attributes["title"].value
      model_url = "https://www.caranddriver.com#{ title.attributes["href"].value }"
      #model.url = main_url

      page = Nokogiri::HTML(open(model_url))
      model.price = page.search(".mb2")[1].text
      if model.price.include?("Not Available")
        model.availability = "not available"
        model.acceleration_speed = "N/A"
        model.horsepower = "N/A"
        model.top_speed = "N/A"
      else
        model.availability = "available"
        model.acceleration_speed = page.search(".f20")[0].text
        model.horsepower = page.search(".f20")[1].text
        model.top_speed = page.search(".f20")[2].text
      end
      models.push(model)
    end
  models
  end

end
