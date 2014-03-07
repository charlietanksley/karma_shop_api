step 'I should see the product :name' do |name|
  send 'I visit the products page'
  send 'I should see the treasure :treasure_name', name
end

step 'the product :name exists' do |name|
  Macro.create_product(name: name)
end

step 'I create a new product :name' do |name|
  attach_file 'img', File.join(Rails.root, 'spec/support/files/300.jpeg')
  fill_in 'attributionText', with: 'something'
  fill_in 'attributionUrl', with: 'url'
  fill_in 'name', with: name
  fill_in 'price', with: 10
  find('[rel~="create-product"]').click
end
