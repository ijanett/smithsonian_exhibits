require 'colorize'

class SmithsonianExhibitsCLI

	def run
		Scraper.scrape_floors
		puts "\n\t Welcome to the Smithsonian National Museum Exhibits!".upcase.blue.bold + " 🏛 "
		puts "__________________________________________________________________________".blue.bold
		# sleep 2
		menu

	end

	def menu
		input = nil

		puts "\nFor a list of exhibits by category, enter 'category'."
		puts "For a list of exibits by floor, enter 'floor'." 
		puts "For a list of all exhibits, enter 'all'."
		
		# while input != 'exit'
		
			input = gets.strip.downcase

			if input == 'category' 
				list_by_category
			elsif input == 'floor'
				list_by_floor
			elsif input == 'all'
				list_all
			elsif input == 'exit'
				goodbye
			else
				puts "Invalid entry. Please enter a valid option or enter 'exit'."
			end
		# end
	end

	def list_by_category
		puts "Please select a category."

		Category.all.each do |category|
			puts " #{category.name}"
			category.all.each_with_index do |exhibit, index|
				puts " #{index+1}.  #{exhibit.name}"
			end
		end
		# input = gets.to_i

		# if input == category[index-1]
		# 	puts "#{}"


		# Exhibit.all.each_with_index do |exhibit, index|
		# 	if exhibitputs "#{exhibit.category}"
			# end
	end

	def list_by_floor

		
	end

	def list_all
		Exhibit.all.each_with_index do |exhibit, index|
			puts "\t#{index+1}.  #{exhibit.name}"
		end
	end

	def goodbye
		puts "Thank you for stopping by!" 
	end

end

