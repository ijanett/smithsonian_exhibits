require 'colorize'

class SmithsonianExhibitsCLI


	def initialize
		Scraper.scrape_exhibits
		# binding.pry
	end

	def run
		puts "\n\t Welcome to the Smithsonian National Museum Exhibits!".upcase.blue.bold + " 🏛 "
		puts "__________________________________________________________________________".blue.bold
		# sleep 2
		menu
		goodbye
	end

	def menu
		input = nil

		puts "\nTo get more info on an exhibit, please select an exhibit from 1-21.\n"
		
		list_exhibits

		@input = gets.strip.chomp

		until @input == "exit"
			if @input.to_i.between?(1, Exhibit.all.length)
				select_exhibit
				menu
			else
				puts "Invalid entry. Please enter a valid option or enter 'exit'."
			end
			@input = gets.strip.chomp

			# if @input == 'exit'
			# 	break
			# end
		end
	end

	def list_exhibits
		Exhibit.all.each_with_index do |exhibit, index|
			puts "\t#{index+1}.  #{exhibit.name}"
		end
	end

	def select_exhibit
		selected_exhibit = Exhibit.find(@input)

		puts "#{selected_exhibit.name}:".light_red.bold
		puts "\n#{selected_exhibit.floor}  |  #{selected_exhibit.category}"
		puts "\n#{selected_exhibit.description}"
		puts "____________________________________________________________________________".blue.bold
	end

	def goodbye
		puts "Thank you for stopping by!" 
	end

	# def list_by_category
	# 	# puts "Please select a category."

	# 	Category.all.each_with_index do |category, index|
	# 		puts "\t#{index+1}.  #{category.name}"
	# 		# category.all.each_with_index do |exhibit, index|
	# 		# 	puts " #{index+1}.  #{exhibit.name}"
	# 		# end
	# 	end
		
	# end

	# def list_by_floor
	
	# end

end

