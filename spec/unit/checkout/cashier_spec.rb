require 'spec_helper'
require_relative '../../../app/models/checkout/cashier'

describe Checkout::Cashier do
  describe 'processing a transaction' do
    before {
      stub_const('Purchase', Class.new)
      stub_const('Bank', Class.new)
    }

    let(:customer) { double('Customer', name: 'name') }
    let(:product) { double('Product', price: 100) }
    let(:cashier) { Checkout::Cashier.new(customer: customer,
        product: product) }

    it 'creates a treasure for and bills the customer' do
      expect(Purchase).to receive(:complete)
        .with(product: product, customer: customer)
      expect(Bank).to receive(:bill)
        .with(customer_name: 'name', amount: 100)
        .and_return(true)
      cashier.checkout
    end
  end
end
