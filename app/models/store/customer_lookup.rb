require_relative '../../../app/models/null_customer'

module Store
  class CustomerLookup
    def self.find(customer_name)
      new(customer_name: customer_name).find
    end

    attr_reader :customer_list, :customer_name
    def initialize(customer_name: nil, customer_list: ::Customer)
      @customer_name = customer_name
      @customer_list = customer_list
    end

    def find
      customer_list.where(name: customer_name).first ||
        NullCustomer.new(name: customer_name)
    end
  end
end
