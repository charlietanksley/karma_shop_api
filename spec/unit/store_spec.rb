require 'spec_helper'
require_relative '../../app/models/store'

describe Store::CustomerStore do
  describe 'customer information' do
    let(:customer) { double('Store::Customer') }
    let(:products) { double('Store::Products') }
    let(:store) { Store::CustomerStore.new(customer: customer,
        products: products) }

    specify 'customer' do
      expect(store.customer).to eq(customer)
    end

    specify 'products' do
      expect(store.products).to eq(products)
    end
  end
end
