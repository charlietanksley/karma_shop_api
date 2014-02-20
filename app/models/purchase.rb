require_relative 'treasure'
require_relative 'treasure_shelf'

class Purchase
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
