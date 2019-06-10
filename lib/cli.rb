require 'colorize'

class SmithsonianExhibitsCLI
	BASE_URL = "https://naturalhistory.si.edu"
	
	def initialize
		Scraper.scrape_exhibits
	end

	def run
		puts "\n\t\tWelcome to the Smithsonian Exhibits App!".upcase.blue.bold + " 🏛 "
		sleep 2
		menu
		goodbye
	end

	def menu
		puts "____________________________________________________________________________".blue.bold
		puts "\nTo get more info on an exhibit, please select an exhibit from 1-21:\n\n"
		
		list_exhibits

		@input = gets.strip.chomp

		until @input.downcase == "exit"
			if @input.to_i.between?(1, Exhibit.all.length)
				select_exhibit
				back		
			elsif @input == "back"
				menu
			else
				puts "\nInvalid entry. Please enter a valid option.\n"
				back
			end
			
			goodbye if @input.downcase == "exit"
			
			@input = gets.strip.chomp	
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

		puts "____________________________________________________________________________".blue.bold
		puts "\nExhibit name: ".upcase.blue.bold + " #{selected_exhibit.name}".light_red.bold
		puts "\nLocated on: ".upcase.blue.bold + "#{selected_exhibit.floor}  | " + "Category: ".upcase.blue.bold + "#{selected_exhibit.category}"
		puts "\nExhibit description: ".upcase.blue.bold + "\n#{selected_exhibit.description}"
		puts "\nExhibit url: ".upcase.blue.bold + "\n#{BASE_URL}#{selected_exhibit.url}"
		puts "____________________________________________________________________________".blue.bold
	end

	def goodbye
		puts "\nThank you for stopping by!".bold + " 🐘 🦋 🌿 🕷 🐋 🦖\n\n"
		exit
	end
end

