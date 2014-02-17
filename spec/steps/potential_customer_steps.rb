step "I should see :names in the potential customer list" do |names|
  names.split(', ').each do |name|
    expect(page).to have_content(name)
  end
end
