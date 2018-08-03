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

      case input
      when "1"
         puts "Please send checks to:"
         puts ""
         puts "Hornell Humane Society"
         puts "7649 Industrial Park Road"
         puts "Hornell, NY 14843"
      when "2"
        puts "Here are the types of supplies needed:"

        headings
        headings_menu
        return

      when "exit"
        goodbye

      else
         puts "PLEASE CHOOSE A VALID OPTION or exit."
      end
     end
   end

   def headings
     HumaneSociety::Scraper.scrape_donations #calls @@all array with headings
     @supply = HumaneSociety::Supplies.all

     @supply.each.with_index(1) do |donate, index| #iterates over and creates numbered list of headings
       puts "#{index}. #{donate.heading}"
     end
   end

   def headings_menu
     input = nil
     while input != "exit"
        puts ""
        puts "Please enter the number for your choice or type exit:"
        input = gets.strip.downcase

       case input
       when "1"
         puts "Toys & Enrichment"
         puts ""
         HumaneSociety::Scraper.scrape_toys
       when "2"
         puts "Office Supplies"
         puts "Most needed items are marked with a star."
         puts ""
         HumaneSociety::Scraper.scrape_office
       when "3"
         puts "Cleaning Supplies"
         puts "Most needed items are marked with a star."
         puts ""
         HumaneSociety::Scraper.scrape_cleaning
       when "4"
         puts "Food & Treats"
         puts ""
         HumaneSociety::Scraper.scrape_food
       when "5"
         puts "Kennel Care"
         puts "Most needed items are marked with a star."
         puts ""
         HumaneSociety::Scraper.scrape_kennel
       when "6"
         puts "More!"
         puts "Most needed items are marked with a star."
         puts ""
         HumaneSociety::Scraper.scrape_more

       when "exit"
         goodbye

       else
         puts "Please choose a VALID OPTION or exit."
       end
     end
   end

   def goodbye
     puts ""
     puts "Thank you!"
     puts ""
   end
 end
