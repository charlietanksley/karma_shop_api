require File.join(Rails.root, 'lib/customer_data')

class PotentialCustomerList
  def self.alphabetical
    new
      .all
      .alphabetical
      .done
  end

  attr_reader :list, :customer_datastore
  def initialize(list: Array.new, customer_datastore: CustomerData::Storage.new)
    @list = list
    @customer_datastore = customer_datastore
  end

  def all
    initialize_with_list(customer_datastore.all_customers)
  end

  def alphabetical
    initialize_with_list(list.sort)
  end

  def done
    list
  end

  private

  def initialize_with_list(list)
    self.class.new(list: list, customer_datastore: customer_datastore)
  end
end
