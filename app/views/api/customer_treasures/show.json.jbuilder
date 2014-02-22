json.set! :treasures do
  json.customer @customer_treasures.customer
  json.treasures do
    json.array! @customer_treasures.treasures
  end
end
