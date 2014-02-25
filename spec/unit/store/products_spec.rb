require 'spec_helper'
require_relative '../../../app/models/null_customer'
require_relative '../../../app/models/store/products'

describe Store::Products do
  before {
    stub_const('Product', Class.new)
    stub_const('Store::CustomerLookup', Class.new)
  }

  describe 'finding products for a customer' do
    let(:sample_product) { double('Product', id: 1,
        price: 10,
        name: 'name',
        src: 'src',
        attribution_url: 'url',
        attribution_text: 'text')}
    let(:product_list) { double('Product', all: [sample_product])}

    describe 'basic product information' do
      before {
        expect(Store::CustomerLookup).to receive(:find)
          .and_return(NullCustomer.new)
      }

      let(:products) { Store::Products.new(product_list: product_list).all }
      let(:product) { products.first }

      it 'gets all the relevant products' do
        expect(products).to eq([sample_product])
      end

      it 'includes all the properties of the products' do
        expect(product.id).to eq(1)
        expect(product.price).to eq(10)
        expect(product.name).to eq('name')
        expect(product.src).to eq('src')
        expect(product.attribution_url).to eq('url')
        expect(product.attribution_text).to eq('text')
      end
    end

    describe 'customer-specific product information' do
      it 'when given a customer who owns products' do
        sample_product_two = double('Product', id: 2)
        customer = double('Customer',
          treasures: [double('Treasure', product_id: sample_product.id),
            double('Treasure', product_id: sample_product_two.id)])

        product = Store::Products.new(customer: customer,
          product_list: product_list)
          .all
          .first
        expect(product.units_owned).to eq(1)
      end

      it 'when given a customer who owns no products' do
        customer = double('Customer', treasures: Array.new)
        product = Store::Products.new(customer: customer,
          product_list: product_list)
          .all
          .first
        expect(product.units_owned).to eq(0)
      end

      it 'when given a NullCustomer' do
        expect(Store::CustomerLookup).to receive(:find)
          .and_return(NullCustomer.new)

        product = Store::Products.new(product_list: product_list)
          .all
          .first
        expect(product.units_owned).to eq(0)
      end
    end
  end
end
