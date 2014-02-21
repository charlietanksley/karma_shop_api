require 'delegate'
require_relative 'customer_lookup'

module Store
  class Products
    attr_reader :customer_name, :customer_list, :product_list
    def initialize(customer: nil, product_list: Product, customer_name: nil, customer_list: Store::CustomerLookup)
      @customer = customer
      @customer_name = customer_name
      @customer_list = customer_list
      @product_list = product_list
    end

    def all
      product_list.all.map { |product|
        StockedProduct.new(product, customer.treasures)
      }
    end

    def customer
      @customer ||= customer_list.find(customer_name)
    end

    class StockedProduct < SimpleDelegator
      attr_reader :product, :customer_treasures
      def initialize(product, customer_treasures)
        super(product)
        @customer_treasures = customer_treasures
      end

      def units_owned
        treasure_ids.count(id)
      end

      private

      def treasure_ids
        @treasure_ids ||= customer_treasures.map(&:id)
      end
    end
  end
end
