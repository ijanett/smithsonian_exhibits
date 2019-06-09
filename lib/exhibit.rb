require 'pry'

class Exhibit

	# an exhibit belongs to a floor and a category

	attr_accessor :name, :category, :floor, :description
	
	@@all = []

	def initialize(exhibit_info)
		exhibit_info.each {|k, v| self.send(("#{k}="), v)}
		@@all << self unless @@all.include?(self)
	end

	def self.create_from_array(exhibits_arr)
		exhibits_arr.each{|exhibit| Exhibit.new(exhibit)}
	end

	# def initialize(name, category = nil, floor= nil)
	# 	@name = name
	# 	@category = category
	# 	@floor = floor
	# 	@description = description
	# 	@@all << self unless @@all.include?(self)
	# end	

	# def self.description
	# 	@description = description
	# end
	
	def self.all
		@@all
	end
# 
	# def self.print_all
	# 	all.each_with_index do |exhibit, index|
	# 		puts "#{index+1}.  #{exhibit.name}"
	# 	end
	# end
# binding.pry
end