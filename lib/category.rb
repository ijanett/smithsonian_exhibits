class Category

	attr_accessor :name, :exhibit

	@@all = []

	def initialize(name)
		@name = name
		@@all << self unless @@all.include?(self)
	end

	def self.all
		@@all
	end

	def self.create(name, exhibit= nil, floor= nil)
		category = self.new(name)
		# category.save
		# category
	end

	def self.find_by_name(name)
		all.find{|category| name == category.name}
	end

	def self.find_or_create_by_name(name)
		find_by_name(name) || self.create(name)
	end

end
