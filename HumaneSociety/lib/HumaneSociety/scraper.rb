class HumaneSociety::Scraper

  BASE_URL = "https://www.hornellanimalshelter.org/donate.html"

  #@@url =

  def self.scrape_donations
    doc = Nokogiri::HTML(open(BASE_URL))

    doc.css("box-09").each do |donate|
      heading = donate.css(".box-09_cnt a").text


      HumaneSociety::Supplies.new(heading)
    end
  end

  def self.scrape_donations_items(donation_type)
    doc = Nokogiri::HTML(open(BASE_URL))
    list = donate.css(".box-09_cnt a").children
  end

end
