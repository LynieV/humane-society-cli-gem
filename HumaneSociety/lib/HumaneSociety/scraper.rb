class HumaneSociety::Scraper

  BASE_URL = "https://www.hornellanimalshelter.org/donate.html"

  #@@url =

  def self.scrape_donations
    doc = Nokogiri::HTML(open(BASE_URL))

    doc.css("box-09").each do |donate|
      heading = donate.css(".box-09_cnt a").text
      url = donate.css(".box-09_cnt a").attribute("href").value

      HumaneSociety::DonationType.new(heading, url)
    end
  end

  def self.scrape_donations_items(donation_type)
    url = donation_type.url
    doc = Nokogiri::HTML(open(url))
    donation_type.list_items = doc.css() #list items <li>
  end

end
