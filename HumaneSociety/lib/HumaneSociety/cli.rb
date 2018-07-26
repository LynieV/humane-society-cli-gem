# CLI Controller

class HumaneSociety::CLI

  def start
    puts "Welcome to Hornell Humane Society donations."
    puts ""
    list_options
    menu
    goodbye

    HumaneSociety::Scraper.scrape_donations
    #main_menu
  end

  def list_options
    puts "What type of donation would you like to make?"
    puts "1 Financial"
    puts "2 Supplies"
    puts "Type exit to exit"
  end

  def menu
    input = nil
    while input != "exit"
      puts ""
      puts "Please enter the number for your choice or type exit:"
      input = gets.strip.downcase
      case input
      when "1"
        puts "Please send checks to:"
        puts ""
        puts "Hornell Humane Society"
        puts "7649 Industrial Park Road"
        puts "Hornell, NY 14843"
      when "2"
        puts "Supply Headings"
      #when "list"
        #list_options
      else
        "Please choose a valid option or type exit"
      end
    end
  end

  #def main_menu
    #puts "Here is a list of donation options!"

    #donations = HumaneSociety::Supplies.all

    #donations.each.with_index(1) do |index, donate|
      #puts "#{index}. #{donate.heading}"
    #end

    #puts ""
    #puts "Please select a donation type to view needed items:"

    #input = gets.strip
    #index = input.to_i - 1

    #supply = HumaneSociety::Supplies.all[index]

    #HumaneSociety::Scraper.scrape_donations_items(donation_type)

    #puts "Here are the items:"
    #puts ""
    #puts supply.list_items

    #main_menu

  #end

  def goodbye
    puts "Thank you!"
  end

end

#User will see a greeting and be asked to enter a number
#corresponding to a prompt:
#1 Exit
#2 Financial
#3 Supply List

#  list.each.with_index(1) do |list, index|
#    puts "#{index}. #{list.title}"
#  end

#when user chooses supply list, they will see a list
#of headings for items needed

#from this list, the user will be asked to enter the number
#for the heading and will see the list of items from that heading
#or go back to the main menu

#there is a supply class to represent each category
#of supplies. A supply scraper to scrape the site and Humane Society
#CLI to interact with the user
