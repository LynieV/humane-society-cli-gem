class HumaneSociety::Scraper

  BASE_URL = "https://www.hornellanimalshelter.org/donate.html"

  #@@url =

  def self.scrape_donations
    #binding.pry
    doc = Nokogiri::HTML(open(BASE_URL))

    supply_string = doc.css(".box-09_cnt a").text
    supply_arrays = supply_string.split(" ")
    supply_array = supply_arrays.map {|supplies| supplies.split(/(?=[A-Z&])/)}.flatten
    supply_array.delete_at(-2)

    #array_headings
    heading = [supply_array[0..2].join(" "),
    supply_array[3..4].join(" "),
    supply_array[5..6].join(" "),
    supply_array[7..9].join(" "),
    supply_array[10..11].join(" "),
    supply_array[12]]

        HumaneSociety::Supplies.new(heading)

  end

  def self.scrape_donations_items(donation_type)
    doc = Nokogiri::HTML(open(BASE_URL))
    list = donate.css(".box-09_cnt a").children
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
