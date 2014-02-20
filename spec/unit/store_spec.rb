require 'spec_helper'
require_relative '../../app/models/store'

describe Store do
  describe 'customer information' do
    describe 'when there is a customer with a purchase history' do
      let(:db_customer) { double('Customer', attributes: Hash[name: 'name', id: 1]) }
      let(:customer_data) { double('CustomerData', available_karma: 100) }
      let(:customer_list) { double('Customer', where: [db_customer]) }
      let(:store) { Store.new(customer_name: 'name',
          customer_data: customer_data,
          customer_list: customer_list) }
      let(:customer) { store.customer }

      it 'finds the customer' do
        expect(customer.id).to eq(1)
        expect(customer.name).to eq('name')
      end

      it 'inserts the customer karma' do
        expect(customer.available_karma).to eq(100)
      end
    end

    describe 'when there is no customer' do
      let(:customer_list) { double('Customer', where: []) }

      it 'returns a customer with no id, but with karma and the right name' do
        customer_data = double('CustomerData', available_karma: 100)
        store = Store.new(customer_name: 'name',
          customer_list: customer_list,
          customer_data: customer_data)
        customer = store.customer

        expect(customer.id).to be_nil
        expect(customer.available_karma).to eq(100)
        expect(customer.name).to eq('name')
      end
    end
  end
end
