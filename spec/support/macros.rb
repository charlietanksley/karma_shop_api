module Macro
  module_function

  def create_product(attr={})
    Product.create(
      Hash[attribution_text: 'anyone',
        attribution_url: 'http://placekitten.com/g/200/300',
        name: 'some name',
        price: 10,
        src: 'http://placekitten.com/g/200/300'].merge(attr)
      )
  end
end
