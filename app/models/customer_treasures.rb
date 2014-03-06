require_relative 'null_customer'

class CustomerTreasures
  def self.for(name)
    new(name).treasures
  end

  attr_reader :customer_list, :name
  def initialize(name, customer_list: Customer)
    @name = name
    @customer_list = customer_list
  end

  def treasures
    Hashie::Mash.new(customer: customer,
      treasures: elaborated_treasures)
  end

  private

  def customer
    @customer ||=
      customer_list.where(name: name).first ||
      NullCustomer.new(name: name)
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
