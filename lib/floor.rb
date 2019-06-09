require 'pry'

class Floor

	# a floor has many exhibits

	attr_accessor :name

	@@all = []

	def initialize(name)
		@name = name
		@@all << self unless @@all.include?(self)
	end

	def self.all
		@@all
	end

	def self.create_from_array(floors_arr)
		floors_arr.each {|floor| Floor.new(floor)}
	end

	def exhibits
		Exhibits.all.select do |exhibit|
			exhibit.floor == self
		end
	end
	
	# def self.find_by_name(name)
	# 	all.find{|category| name == category.name}
	# end

	# def self.find_or_create_by_name(name)
	# 	find_by_name(name) || self.create(name)
	# end
end