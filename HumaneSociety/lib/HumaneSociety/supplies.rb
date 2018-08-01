class HumaneSociety::Supplies
  attr_accessor :heading, :list_items

  @@all = []

  def initialize(heading)
    @heading = heading
    @@all << self

  end

  def self.all
    @@all
  end

end
