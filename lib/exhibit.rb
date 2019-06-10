require 'pry'

class Exhibit

	# an exhibit belongs to a floor and a category

	attr_accessor :name, :category, :floor, :description, :url
	
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
	
	# def self.add_attribute(exhibit_hash)
	# 	exhibit_hash.each do |k, v|
	# 		self.send(("#{k}="), v)
	# 	end
	# end

	def self.all
		@@all
	end

	def self.find(input)
		self.all[input.to_i-1]
	end
end