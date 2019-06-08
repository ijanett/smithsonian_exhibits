require 'pry'

class Exhibit

	# an exhibit belongs to a floor and a category

	attr_accessor :name, :category, :description
	
	@@all = []

	def initialize(name, category, floor= "TBD")
		@name = name
		@category = category
		@floor = floor
		@@all << self unless @@all.include?(self)
	end	

	def self.description
		@description = description
	end
	
	def self.all
		@@all
	end

	def self.print_all
		all.each_with_index do |exhibit, index|
			puts "#{index+1}.  #{exhibit.name}"
		end
	end
# binding.pry
end