class HumaneSociety::Supplies
  attr_accessor :heading, :list_items

  @@all = []

  def initialize(heading)
    @heading = heading
    #@url = url
    @@all << self
  end

  def self.all
    @@all
  end

end
