class HumaneSociety::Supplies
  attr_accessor :heading, :list_items

  @@all = []

  def initialize(heading)
    @heading = heading
    #@list_items = list_items
    @@all << self
  end

  def self.list_items
    #do I put code for list_items here?
    #how do I call range of index numbers according to heading #?
    #do I do this ^ here?
  end

  def self.all
    @@all
  end

end
