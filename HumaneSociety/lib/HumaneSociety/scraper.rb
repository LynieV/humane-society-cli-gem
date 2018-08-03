class HumaneSociety::Scraper

  BASE_URL = "https://www.hornellanimalshelter.org/donate.html"

  def self.scrape_donations
    doc = Nokogiri::HTML(open(BASE_URL))

    supply_string = doc.css(".box-09_cnt a").text #text jumbled together
    #supply_string = doc.css(".box-09_cnt a")[0].text
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
    #binding.pry
  end

  def self.scrape_donations_items
    doc = Nokogiri::HTML(open(BASE_URL))
    list = doc.css(".box-09_cnt li")[0..8]# - best way to separate lists?
    list_items = list.each {|item| puts "#{item.text}"}

    #Is there a way to call out list according to heading?
    #Or create an array of index numbers to call with heading number?
    #doc.css(".box-09_cnt li")[9..18]
    #doc.css(".box-09_cnt li")[19..32]
    #doc.css(".box-09_cnt li")[33..36]
    #doc.css(".box-09_cnt li")[37..49]
    #doc.css(".box-09_cnt li")[50..55]
    #binding.pry
    #HumaneSociety::Supplies.new(list_items)
  end

end

#  def self.scrape_companies
#doc = Nokogiri::HTML(open(BASE_URL))

#doc.css('#list-detail-left-column').each do |companies|
#companies.css('.company')[0..9].each do |company_info|
#name = company_info.css('a.title').text.strip
#url = company_info.css('a.title').attribute('href').value
#industry = company_info.css('.industry').text.strip
#Top10Companies::Company.new(name, url, industry)
#end
#end
#end

#binding.pry
#doc.css(".box-09").each do |donate|
  #heading = donate.css(".box-09_cnt a").text



      # supply_arrays.map do |supplies|
      #     supplies.split(/(?=[A-Z&])/)
      #
      # end
      #supply_string = doc.css(".box-09_cnt a").children.text
      #binding.pry
        #heading = supply_string.split.each_slice.map{|a|a.join ' '}
      #binding.pry
      #array.join(" ")

      #str = 'one two three four five six seven'
      #str.split.each_slice(2).map{|a|a.join ' '}
      #=> ["one two", "three four", "five six", "seven"]

    #doc.css(".box-09_cnt a").text
  #<< HumaneSociety::Supplies.all
