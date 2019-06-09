require 'pry'

class Scraper 

    def self.open_page
        Nokogiri::HTML(open("https://naturalhistory.si.edu/exhibits"))
    end

    def self.scrape_exhibits
        exhibits_arr = []

        elements_arr = self.open_page.css(".exhibit-teaser__second")
        elements_arr.each do |element|
            name = element.css("h2").map(&:text)[0]
            category = element.css("span").text.split(" | ")[1].split(" ").map{|word| word.capitalize}.join(" ")
            floor = element.css("span").text.split(" | ")[0].split(" ").map{|word| word.capitalize}.join(" ")
            description = element.css(".exhibit-teaser__text p").map(&:text)[0]
# binding.pry
            exhibit_info = {
                :name => name,
                :category => category,
                :floor => floor,
                :description => description
            }

            exhibits_arr << exhibit_info
            
        end
        Exhibit.create_from_array(exhibits_arr)
# binding.pry
    end

    def self.scrape_floors # hehe :D
        floors_arr = []

        elements_arr = self.open_page.css(".exhibit-teaser__second")
        elements_arr.each do |element|
            name = element.css("span").text.split(" | ")[0].split(" ").map{|word| word.capitalize}.join(" ")

            floors_arr << name
        end
        floors_arr.uniq!

        Floor.create_from_array(floors_arr)
        binding.pry
    end

    

        #parse out the elemnts that have the data we want 
        #create instances of Category, Floor, Exhibit with that data     
end