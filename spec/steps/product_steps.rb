step 'the product :name exists' do |name|
  Macro.create_product(name: name)
end
