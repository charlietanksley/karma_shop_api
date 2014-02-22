step 'I should see the sale item :name' do |name|
  content_area = page.all('.product-details').first
  expect(content_area).to have_content(name)
end
