class HumaneSociety::DonationType
  attr_accessor :heading, :url, :list_items

  @@all = []

  def initialize(heading, url)
    @heading = heading
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

end
