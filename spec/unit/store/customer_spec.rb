require 'spec_helper'
require_relative '../../../app/models/store/customer'

describe Store::Customer do
  before { stub_const('Store::CustomerLookup', Class.new) }
  let(:customer) { double('Customer', name: 'name', id: 1) }
  let(:customer_data) { double('CustomerData', available_karma: 100) }

  specify '#id' do
    store_customer = Store::Customer.new(customer: customer)
    expect(store_customer.id).to eq(1)
  end

  specify '#name' do
    store_customer = Store::Customer.new(customer: customer)
    expect(store_customer.name).to eq('name')
  end

  specify '#available_karma' do
    store_customer = Store::Customer.new(customer: customer, customer_data: customer_data)
    expect(store_customer.available_karma).to eq(100)
  end

  it 'raises an ArgumentError if given neither a customer nor a customer name' do
    expect {
      Store::Customer.new
    }.to raise_error(ArgumentError)
  end

  it 'can look up a customer' do
    name = 'some term or other'
    list = double('Store::CustomerLookup')
    expect(Store::CustomerLookup).to receive(:find)
      .with(name)

    Store::Customer.new(customer_name: name).customer
  end
end
