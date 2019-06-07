
class Exhibit

	# an exhibit belongs to a floor and a category

	attr_accessor :name, :category, :description, :things_to_do
	
	@@all = []

	def initialize(name, category, floor= "TBD")
		@name = name
		@category = category
		@floor = floor
		@@all << self
	end
	
	def self.description
		# Scraper.self.scrape_descriptions
		
		# descriptions_arr.each do |description|
		# 	@description = description
		# end
	end

	def things_to_do
		# @things_to_do ||= 
	end
	
	def self.all
		@@all
	end

end