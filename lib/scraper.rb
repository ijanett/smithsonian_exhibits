require 'pry'

class Scraper 

    def self.open_page
        Nokogiri::HTML(open("https://naturalhistory.si.edu/exhibits"))
    end

    def self.scrape_exhibits
        elements_arr = self.open_page.css(".exhibit-teaser__second")
    
            # i = 0
        elements_arr.each do |element|
            name = element.css("h2").map(&:text)[0]
            if element.css("span").text.split(" | ")[1] == nil
                category = element.css("span.exhibit-teaser__subtitle").text.split(" – ")[0]
                # binding.pry
            else
                category = element.css("span").text.split(" | ")[1]
                floor = element.css("span").text.split(" | ")[0]     
            end

            Exhibit.new(name, category, floor)
            # i += 1
        end
binding.pry
    end

    def self.scrape_descriptions
        descriptions_arr = self.open_page.css("p").map(&:text)
    end
        #parse out the elemnts that have the data we want 
        #create instances of Category, Floor, Exhibit with that data 
end