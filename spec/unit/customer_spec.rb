require 'database_spec_helper'
require_relative '../../app/models/customer'

describe Customer do
  describe 'customers are created with treasure shelves' do
    it 'can be passed in as an argument' do
      customer = Customer.create(name: 'name', treasure_shelf: TreasureShelf.new)
      expect(customer.treasure_shelf).to_not be_nil
    end

    it 'will be created if there is not one' do
      customer = Customer.create(name: 'name')
      expect(customer.treasure_shelf).to_not be_nil
    end
  end
end
