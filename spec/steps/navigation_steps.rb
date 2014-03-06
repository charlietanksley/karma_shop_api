step 'I visit the main page' do
  visit root_path
end

step 'I visit the products page' do
  visit root_path
  click_link('All products')
end

step 'I visit the shopping page for :customer_name' do |customer_name|
  send 'I visit the treasure page for :customer_name', customer_name
  click_link('Go shopping')
end

step 'I visit the treasure page for :customer_name' do |customer_name|
  visit root_path
  visit "/treasures/#{customer_name}"
end
