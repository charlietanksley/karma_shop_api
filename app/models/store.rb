require_relative '../../lib/customer_data'

class Store
  attr_reader :customer_name, :customer_list, :customer_data
  def initialize(customer_name: nil, customer_data: CustomerData, customer_list: Customer)
    @customer_name = customer_name
    @customer_data = customer_data
    @customer_list = customer_list

  end

  def customer
    @customer ||= customer_with_karma
  end

  private

  def customer_with_karma
    customer = lookup_customer
    karma = customer_data.available_karma(customer_name)
    Hashie::Mash.new(customer.attributes.merge(available_karma: karma))
  end

  def lookup_customer
    customer_list.where(name: customer_name).first || NullCustomer.new(customer_name)
  end

  NullCustomer = Struct.new(:name) do
    def attributes
      Hash[id: nil,
        name: name]
    end
  end
end
