# require 'nokogiri'

class Scraper 

    def self.open_page
        Nokogiri::HTML(open("https://naturalhistory.si.edu/exhibits"))
    end

    def self.scrape_exhibits
        exhibits_arr = []

        elements_arr = self.open_page.css(".exhibit-teaser")
        elements_arr.each do |element|
            info_holder = element.css(".exhibit-teaser__second")
            name = info_holder.css("h2").map(&:text)[0]
            category = info_holder.css("span").text.split(" | ")[1].split(" ").map{|word| word.capitalize}.join(" ")
            floor = info_holder.css("span").text.split(" | ")[0].split(" ").map{|word| word.capitalize}.join(" ")
            description = info_holder.css(".exhibit-teaser__text p").map(&:text)[0]
            url_holder = element.css(".exhibit-teaser__first a").attr("href")
            url = url_holder.value

            exhibit_info = {
                :name => name,
                :category => category,
                :floor => floor,
                :description => description,
                :url => url
            }

            exhibits_arr << exhibit_info    
        end
        Exhibit.create_from_array(exhibits_arr)
    end
end