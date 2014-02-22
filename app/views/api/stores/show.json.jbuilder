json.set! :store do
  json.customer @store.customer, :id, :available_karma, :name
  json.products do
    json.array! @store.products, :id, :price, :units_owned, :name, :src, :attribution_url, :attribution_text
  end
end
