module Checkout
  class Funnel
    attr_reader :customer_list, :customer_name, :product_id, :product_list
    def initialize(customer_name: nil, product_id: nil, customer_list: Customer, product_list: Product)
      @customer_name = customer_name
      @product_id = product_id
      @customer_list = customer_list
      @product_list = product_list
    end

    def customer
      @customer ||= customer_list.find_or_create_by(name: customer_name)
    end

    def product
      @product ||= product_list.find(product_id)
    end
  end
end
