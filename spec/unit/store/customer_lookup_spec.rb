require 'spec_helper'
require_relative '../../../app/models/store/customer_lookup'

describe Store::CustomerLookup do
  let(:customer_name) { 'a customer name' }
  let(:customer) { double('Customer') }

  before { stub_const('Customer', Class.new) }

  describe 'finding a customer' do
    let(:customer_list) { double('Customer') }
    let(:customer_lookup) {
      Store::CustomerLookup.new(customer_name: customer_name,
        customer_list: customer_list) }

    it 'returns the customer when there is a customer in the database' do
      expect(customer_list).to receive(:where)
        .with(name: customer_name)
        .and_return(Array[customer])

      expect(customer_lookup.find).to eq(customer)
    end

    describe 'when there is no customer' do
      before {
        expect(customer_list).to receive(:where)
          .with(name: customer_name)
          .and_return(Array.new)
      }

      let(:found_customer) { customer_lookup.find }

      it 'reuturns a NullCustomer' do
        expect(found_customer).to be_a(NullCustomer)
      end

      it 'returns a customer with nil for an id' do
        expect(found_customer.id).to be_nil
      end

      it 'returns a customer with the lookup term as the name' do
        expect(found_customer.name).to eq(customer_name)
      end
    end
  end
end
