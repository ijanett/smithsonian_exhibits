require 'colorize'

class SmithsonianExhibitsCLI

	def run
		Scraper.create_exhibits
		puts "\n\t Welcome to the Smithsonian National Museum Exhibits!".upcase.blue.bold + " 🏛 "
		puts "__________________________________________________________________________".blue.bold
		# sleep 2
		menu
		goodbye

	end

	def menu
		input = nil

		puts "\nFor a list of exhibits by category, enter 'category'."
		puts "For a list of exibits by floor, enter 'floor'." 
		puts "For a list of all exhibits, enter 'all'."
		
		while input != 'exit'
			input = gets.strip.downcase

			case input

			when 'category' 
				list_by_category
			when 'floor'
				list_by_floor
			when 'all'
				list_all
			else
				puts "Invalid entry. Please enter a valid option or enter 'exit'."
			end
		end
	end

	def list_by_category
		
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

