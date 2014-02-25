require 'spec_helper'
require_relative '../../../app/models/checkout/funnel'

describe Checkout::Funnel do
  describe 'assembling customers and products' do
    let(:customer) { double('Customer', name: 'name') }
    let(:product) { double('Product', id: 1) }
    let(:customer_list) { double('Customer') }
    let(:product_list) { double('Product') }

    let(:funnel) { Checkout::Funnel.new(customer_name: customer.name,
        product_id: product.id,
        customer_list: customer_list,
        product_list: product_list) }

    specify 'customer' do
      expect(customer_list).to receive(:find_or_create_by)
        .with(name: 'name')
        .and_return(customer)
      funnel.customer
    end

    specify 'product' do
      expect(product_list).to receive(:find)
        .with(1)
        .and_return(product)
      funnel.product
    end
  end
end
