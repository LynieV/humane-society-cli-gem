class HumaneSociety::Scraper

  BASE_URL = "https://www.hornellanimalshelter.org/donate.html"

  #@@url =

  def self.scrape_donations
    doc = Nokogiri::HTML(open(BASE_URL))
    #binding.pry
    #doc.css(".box-09").each do |donate|
      #heading = donate.css(".box-09_cnt a").text
    supply_string = doc.css(".box-09_cnt a").text
    supply_arrays = supply_string.split(" ")
    supply_array = supply_arrays.map {|supplies| supplies.split(/(?=[A-Z&])/)}.flatten
    supply_array.delete_at(-2)
    # supply_arrays.map do |supplies|
    #     supplies.split(/(?=[A-Z&])/)
    #
    # end
    #supply_string = doc.css(".box-09_cnt a").children.text
    binding.pry
      #heading = supply_string.split.each_slice.map{|a|a.join ' '}
    #binding.pry
    #array.join(" ")
        HumaneSociety::Supplies.new(heading)
          #str = 'one two three four five six seven'
          #str.split.each_slice(2).map{|a|a.join ' '}
          #=> ["one two", "three four", "five six", "seven"]

        #doc.css(".box-09_cnt a").text
      #<< HumaneSociety::Supplies.all
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