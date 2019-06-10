# class Category

# 	attr_accessor :name

# 	@@all = []

# 	def initialize(name)
# 		@name = name
# 		@@all << self unless @@all.include?(self)
# 	end

# 	def self.all
# 		@@all
# 	end

# 	def self.create_from_array(categories_arr)
# 		categories_arr.each {|category| Category.new(category)}
# 	end

# 	def self.exhibits
# 		Exhibits.all.each do |exhibit|
# 			exhibit.category == self
# 		end
# 	end
# 	# def self.find_by_name(name)
# 	# 	all.find{|category| name == category.name}
# 	# end

# 	# def self.find_or_create_by_name(name)
# 	# 	find_by_name(name) || self.create(name)
# 	# end

# end
