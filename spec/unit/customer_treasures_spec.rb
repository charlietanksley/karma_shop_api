require 'spec_helper'
require_relative '../../app/models/customer_treasures'

describe CustomerTreasures do
  describe 'finding the treasures for a customer' do
    let(:name) { 'name' }
    let(:customer_list) { double('Customer') }

    describe 'when the customer does not have an account' do
      before do
        expect(customer_list).to receive(:where)
          .with(name: name)
          .and_return(Array.new)
      end

      let(:customer_treasures) { CustomerTreasures.new(name,
          customer_list: customer_list) }
      let(:treasures) { customer_treasures.treasures }

      it 'returns a customer with the right name' do
        expect(treasures.customer.name).to eq(name)
      end

      it 'returns an empty list of treasures' do
        expect(treasures.treasures).to eq(Array.new)
      end
    end
  end
end
