step 'I should see the product :name' do |name|
  send 'I should see the treasure :treasure_name', name
end

step 'the product :name exists' do |name|
  Macro.create_product(name: name)
end
