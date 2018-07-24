class HumaneSociety::CLI

  def start
    puts "welcome to Hornell Humane Society donations"
    puts ""

    HumaneSociety::Scraper.scrape_donations
    main_menu
  end

  def main_menu
    puts "Here is a list of donation options!"

    donations = HumaneSociety::DonationType.all

    donations.each.with_index(1) do |index, donate|
      puts "#{index}. #{donate.heading}"
    end
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
