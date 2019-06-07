require 'colorize'

class SmithsonianExhibitsCLI

	def run
		Scraper.scrape_exhibits
		puts "\tWelcome to the Smithsonian National Museum Exhibits! 🏛".blue.bold
		# sleep 2
		menu
		goodbye

	end

	def menu
		input = nil
		puts "\nFor a list of exhibits by category, enter 'category'."
		puts "For a list of exibits by floor, enter 'floor'." 
		puts "For a list of all exhibits, enter 'all'."
		
		input = gets.strip.downcase
		
		while input != 'exit'

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
		
	end

	def goodbye
		puts "Thank you for stopping by!" 
	end

end

