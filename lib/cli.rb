require 'colorize'

class SmithsonianExhibitsCLI
	BASE_URL = "https://naturalhistory.si.edu"
	
	def initialize
		Scraper.scrape_exhibits
	end

	def run
		puts "\n\t\tWelcome to the Smithsonian Exhibits App!".upcase.cyan.bold + " 🏛 "
		sleep 2
		menu
		goodbye
	end

	def menu
		puts "____________________________________________________________________________".light_black.bold
		puts "\n\t\t\t\tMain Menu".upcase.green
		puts "\nTo get more info on an exhibit, please select an exhibit from 1-21:\n\n"
		
		list_exhibits

		@input = gets.strip

		until @input.downcase == "exit"
			if @input.to_i.between?(1, Exhibit.all.length)
				select_exhibit
				back		
			elsif @input == "back"
				menu
			else
				puts "\nInvalid entry. ".light_red + "Please select an exhibit from 1-21.\n"
				back
			end
			
			goodbye if @input.downcase == "exit"
			
			@input = gets.strip
		end
	end

	def back
		puts "\nTo go back to the main menu, enter 'back'. To quit, enter 'exit'.\n\n"
	end

	def list_exhibits
		Exhibit.all.each_with_index do |exhibit, index|
			if index.between?(0,8)
				space = "   "
			else
				space = "  "
			end

			puts "#{space}#{index+1}. #{exhibit.name.squeeze(" ")}"
		end
	end

	def select_exhibit
		selected_exhibit = Exhibit.find(@input)

		puts "____________________________________________________________________________".light_black.bold
		puts "\nExhibit name: ".upcase.cyan.bold + " #{selected_exhibit.name.squeeze(" ")}".bold
		puts "\nLocated on: ".upcase.cyan.bold + "#{selected_exhibit.floor}  | " + "Category: ".upcase.cyan.bold + "#{selected_exhibit.category}"
		puts "\nExhibit description: ".upcase.cyan.bold + "\n#{selected_exhibit.description}"
		puts "\nExhibit url: ".upcase.cyan.bold + "\n#{BASE_URL}#{selected_exhibit.url}"
		puts "____________________________________________________________________________".light_black.bold
	end

	def goodbye
		puts "\nThank you for stopping by!".bold + " 🐘 🦋 🌿 🕷 🐋 🦖\n\n"
		exit
	end
end

