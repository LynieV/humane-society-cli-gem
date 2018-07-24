class HumaneSociety::Scraper

  BASE_URL = "https://www.hornellanimalshelter.org/donate.html"

  #@@url =

  def self.scrape_donations
    doc = Nokogiri::HTML(open(BASE_URL))

    doc.css("box-09").each do |donate|
      heading = donate.css(".box-09_cnt box-09_padbot01 cnt-bg05 a").text
      url = donate.css(".box-09_cnt box-09_padbot01 cnt-bg05 a").attribute("href").value

      HumaneSociety::DonationType.new(heading, url)
    end
  end

end
