class NullCustomer
  attr_reader :name
  def initialize(name: nil)
    @name = name
  end

  def id
    nil
  end

  def treasures
    Array.new
  end

  def treasure_shelf
    OpenStruct.new(treasures: treasures)
  end
end
