require_relative 'store/customer'
require_relative 'store/customer_lookup'
require_relative 'store/products'

module Store
  class CustomerStore
    attr_reader :customer, :products
    def initialize(customer: nil, products: nil)
      @customer = customer
      @products = products
    end
  end
end
