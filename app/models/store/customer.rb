require 'forwardable'
require_relative '../../../lib/customer_data'
require_relative 'customer_lookup'

module Store
  class Customer
    extend Forwardable

    attr_reader :customer_data, :customer_list, :customer_name
    def initialize(customer: nil, customer_name: nil, customer_data: CustomerData, customer_list: Store::CustomerLookup)
      @customer = customer
      @customer_name = customer_name
      @customer_list = customer_list
      @customer_data = customer_data
      check_for_customer
    end

    def_delegators :customer, :id, :name

    def available_karma
      @available_karma ||= customer_data.available_karma(customer.name)
    end

    def customer
      @customer ||= customer_list.find(customer_name)
    end

    private

    def check_for_customer
      if @customer.nil? && @customer_name.nil?
        fail ArgumentError.new "Must provide a customer or a name"
      end
    end
  end
end
