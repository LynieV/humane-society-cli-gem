# CLI Controller

class HumaneSociety::CLI

  def start
    puts "Welcome to Hornell Humane Society donations."
    puts ""
    list_options

    main_menu

  end

  def list_options
    puts "What type of donation would you like to make?"
    puts "1 Financial"
    puts "2 Supplies"
    puts "Type exit to exit"
  end

  def main_menu
    input = nil
    while input != "exit"
       puts ""
       puts "Please enter the number for your choice or type exit:"
       input = gets.strip.downcase
       #if input.to_i >0
        #puts @deals{input.to_i - 1}

      case input
      when "1"
       #if input == "1"
         puts "Please send checks to:"
         puts ""
         puts "Hornell Humane Society"
         puts "7649 Industrial Park Road"
         puts "Hornell, NY 14843"
      when "2"
       #elsif input == "2"
        puts "Here are the types of supplies needed:"
        headings
        headings_menu
      when "exit"
        goodbye

      else
         puts "Please choose a valid option or type exit"
      end
     end
   end

   def headings
     HumaneSociety::Scraper.scrape_donations
     @supply = HumaneSociety::Supplies.all

     @supply.each.with_index(1) do |donate, index|
       puts "#{index}. #{donate.heading}"
     end
   end

   def headings_menu
     input = nil
     while input != "exit"
        puts ""
        puts "Please enter the number for your choice or type exit:"
        input = gets.strip.downcase
        #if input.to_i >0
         #puts @deals{input.to_i - 1}

       case input
       when "1"
     HumaneSociety::Scraper.scrape_donations_items
     #If number is 1-6
     #"put the heading for the index I chose"
   end

   def goodbye
     puts ""
     puts "Thank you!"
     puts ""
   end

 end
         #binding.pry
  #     puts ""
  #     puts "Please select a donation type to view needed items:"
  #
  #     input = gets.strip
  #     index = input.to_i - 1
  #
  #     supply = HumaneSociety::Supplies.all[index]
  #
  #     HumaneSociety::Scraper.scrape_donations_items(donation_type)
  #
  #     puts "Here are the items:"
  #     puts ""
  #     puts supply.list_items
  #
  #   #binding.pry
  #   main_menu
  # end



#def menu
  #input = nil
#   while input != "exit"
#     puts ""
#     puts "Please enter the number for your choice or type exit:"
#     input = gets.strip.downcase
#     #case input
#     #when "1"
#     if input == "1"
#       puts "Please send checks to:"
#       puts ""
#       puts "Hornell Humane Society"
#       puts "7649 Industrial Park Road"
#       puts "Hornell, NY 14843"
#     #when "2"
#     elsif input == "2"
#
#       puts "Supplies needed:"
#       supplies = HumaneSociety::Supplies.all
#
#     #when "list"
#       #list_options
#     else
#       "Please choose a valid option or type exit"
#     end
#   end
# end


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
