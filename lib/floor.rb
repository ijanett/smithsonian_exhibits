class Floor

	# a floor has many exhibits

	attr_accessor :level

	@@all = []

	def initialize(level)
		@level = level
		@@all << self
	end

	def self.all
		@@all
	end

	def exhibits
		Exhibits.all.select do |exhibit|
			exhibit.floor == self
		end
	end

	def self.find_or_create_by
	#create self.find_or_create_by methods class method 
	end
end