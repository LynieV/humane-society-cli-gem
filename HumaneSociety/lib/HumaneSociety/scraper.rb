class HumaneSociety::Scraper

  BASE_URL = "https://www.hornellanimalshelter.org/donate.html"

  def self.scrape_donations
    doc = Nokogiri::HTML(open(BASE_URL))

    supply_string = doc.css(".box-09_cnt a").text #text jumbled together
    supply_arrays = supply_string.split(" ") #split text at spaces
    supply_array = supply_arrays.map {|supplies| supplies.split(/(?=[A-Z&])/)}.flatten
      #split at capital letters and & and nested array becomes one array of strings
    supply_array.delete_at(-2) #remove final "&"

    headings = [supply_array[0..2].join(" "),
    supply_array[3..4].join(" "),
    supply_array[5..6].join(" "), # join strings into array of heading strings
    supply_array[7..9].join(" "),
    supply_array[10..11].join(" "),
    supply_array[12]]

    headings.each do |heading|
      HumaneSociety::Supplies.new(heading)
    end
  end

  def self.scrape_toys
    doc = Nokogiri::HTML(open(BASE_URL))
    list = doc.css(".box-09_cnt li")[0..8] #call list elements by index number
    list_items = list.each {|item| puts "#{item.text}"} #puts list
  end

  def self.scrape_office
    doc = Nokogiri::HTML(open(BASE_URL))
    list = doc.css(".box-09_cnt li")[9..18]
    list_items = list.each {|item| puts "#{item.text}"}
  end

  def self.scrape_cleaning
    doc = Nokogiri::HTML(open(BASE_URL))
    list = doc.css(".box-09_cnt li")[19..32]
    list_items = list.each {|item| puts "#{item.text}"}
  end

  def self.scrape_food
    doc = Nokogiri::HTML(open(BASE_URL))
    list = doc.css(".box-09_cnt li")[33..36]
    list_items = list.each {|item| puts "#{item.text}"}
  end

  def self.scrape_kennel
    doc = Nokogiri::HTML(open(BASE_URL))
    list = doc.css(".box-09_cnt li")[37..49]
    list_items = list.each {|item| puts "#{item.text}"}
  end

  def self.scrape_more
    doc = Nokogiri::HTML(open(BASE_URL))
    list = doc.css(".box-09_cnt li")[50..55]
    list_items = list.each {|item| puts "#{item.text}"}
  end
end


  #Is there a way to call out list according to heading?
  #Or create an array of index numbers to call with heading number?
  # is index number the best way to separate lists?
