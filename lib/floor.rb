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

	def self.create(name, exhibit= nil, floor= nil)
		floor = self.new(name)
		floor.save
		floor
	end

	def self.find_by_name(name)
		all.find{|category| name == category.name}
	end

	def self.find_or_create_by_name(name)
		find_by_name(name) || self.create(name)
	end
end