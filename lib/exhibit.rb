require 'pry'

class Exhibit

	# an exhibit belongs to a floor and a category

	attr_accessor :name, :category, :floor, :description
	
	@@all = []

	def initialize(exhibit_info)
		exhibit_info.each do |k, v| 
			self.send(("#{k}="), v)
		end
		@@all << self unless @@all.include?(self)
	end

	def self.create_from_array(exhibits_arr)
		exhibits_arr.each{|exhibit| Exhibit.new(exhibit)}
	end
	
	def self.all
		@@all
	end

	def self.find(input)
		self.all[input.to_i-1]
	end

# binding.pry
end