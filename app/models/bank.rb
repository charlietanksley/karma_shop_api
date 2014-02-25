require_relative '../../lib/customer_data'

class Bank
  def self.bill(customer_name: nil, amount: nil)
    new(customer_name: customer_name)
      .bill(amount)
  end

  attr_reader :customer_name, :karma_storage
  def initialize(customer_name: nil, karma_storage: CustomerData)
    @customer_name = customer_name
    @karma_storage = karma_storage
  end

  def bill(amount)
    karma_storage.charge_account(term: customer_name, amount: amount)
  end
end
