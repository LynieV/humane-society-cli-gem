class HumaneSociety::Supplies
  attr_accessor :heading, :list_items

  @@all = []

  def initialize(heading)
    @heading = heading
    #@list_items = list_items
    @@all << self
  end

  def self.list_items
  end

  def self.all
    @@all
  end

end
