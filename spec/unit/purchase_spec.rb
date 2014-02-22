require 'database_spec_helper'
require_relative '../../app/models/purchase'

describe Purchase do
  before do
    stub_const('Treasure', Class.new)
  end

  it 'buying an item for yourself' do
    treasure_shelf = double('TreasureShelf')
    product = double('Product', price: 100, id: 1)
    treasure = double('Treasure')

    purchase = Purchase.new(product: product, treasure_shelf: treasure_shelf)
    expect(Treasure).to receive(:create)
      .with({product: product,
        purchase_price: product.price,
        treasure_shelf: treasure_shelf})
      .and_return(treasure)
    expect(treasure_shelf).to receive(:add)
      .with(treasure)
      .and_return(true)

    purchase.complete
  end
end
