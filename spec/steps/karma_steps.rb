step ":terms all have karma" do |terms|
  terms.split(', ').each do |term|
    SpecRedis.add_term_with_points(term, Random.rand(20))
  end
end

step ":term can afford :name" do |term, name|
  product = Product.where(name: name).first
  SpecRedis.add_term_with_points(term, product.price + 5)
end
