step 'I should see the sale item :name' do |name|
  expect(page.find('.store-item-details')).to have_content(name)
end

step 'I buy :name' do |name|
  find('.buy-now').click
end
