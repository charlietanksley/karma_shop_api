step ":customer_name has :treasure_name as a treasure" do |customer_name, treasure_name|
  customer = Customer.create(name: customer_name, treasure_shelf: TreasureShelf.new)
  product = Macro.create_product(name: treasure_name)

  purchase = Purchase.new(product: product,
    treasure_shelf: customer.treasure_shelf)
  purchase.complete
end

step "I should see the treasure :treasure_name" do |treasure_name|
  expect(page.find("img[alt='#{treasure_name}']")).to_not be_nil
end
