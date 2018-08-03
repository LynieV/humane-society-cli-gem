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
         puts "PLEASE CHOOSE A VALID OPTION or exit."
      end
     end
   end

   def headings
     HumaneSociety::Scraper.scrape_donations
     @supply = HumaneSociety::Supplies.all
     #binding.pry
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
         puts "Toys & Enrichment"
         puts ""
         HumaneSociety::Scraper.scrape_donations_1
       when "2"
         puts "Office Supplies"
         puts ""
         HumaneSociety::Scraper.scrape_donations_2
       when "3"
         puts "Cleaning Supplies"
         puts ""
         HumaneSociety::Scraper.scrape_donations_3
       when "4"
         puts "Food & Treats"
         puts ""
         HumaneSociety::Scraper.scrape_donations_4
       when "5"
         puts "Kennel Care"
         puts ""
         HumaneSociety::Scraper.scrape_donations_5
       when "6"
         puts "More!"
         puts ""
         HumaneSociety::Scraper.scrape_donations_6

       when "exit"
         goodbye

       else
         puts "Please choose a valid option or exit."
       end
     end
   end

   def goodbye
     puts ""
     puts "Thank you!"
     puts ""
     #break
   end

 end
