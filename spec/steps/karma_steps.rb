step ":terms all have karma" do |terms|
  terms.split(', ').each do |term|
    SpecRedis.add_term_with_points(term, Random.rand(20))
  end
end
