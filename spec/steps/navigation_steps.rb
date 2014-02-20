step "I visit the main page" do
  visit root_path
end

step "I visit the treasure page for :customer_name" do |customer_name|
  visit root_path
  visit "/treasures/#{customer_name}"
end
