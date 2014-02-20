CustomerTreasures = Struct.new(:name) do
  def self.for(name)
    new(name).treasures
  end

  def treasures
    Hashie::Mash.new(customer: customer,
      treasures: elaborated_treasures)
  end

  private

  def customer
    @customer ||= Customer.where(name: name).first
  end

  def elaborated_treasures
    treasure_shelf.treasures.map { |treasure|
      treasure.product
    }
  end

  def treasure_shelf
    @treasure_shelf ||= customer.treasure_shelf
  end
end
