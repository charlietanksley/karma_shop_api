require_relative 'treasure'
require_relative 'treasure_shelf'

class Purchase
  def self.complete(product: nil, customer: nil)
    new(product: product, treasure_shelf: customer.treasure_shelf)
      .complete
  end

  attr_reader :product, :treasure_shelf
  def initialize(product: nil, treasure_shelf: nil)
    @product = product
    @treasure_shelf = treasure_shelf
  end

  def complete
    treasure_shelf.add(treasure)
  end

  private

  def treasure
    @treasure ||= Treasure.create(product: product,
      purchase_price: product.price,
      treasure_shelf: treasure_shelf)
  end
end
