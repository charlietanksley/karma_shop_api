require_relative '../bank'

module Checkout
  class Cashier
    attr_reader :bank, :customer, :product, :purchase_klass

    def initialize(customer: nil, product: nil, purchase_klass: Purchase, bank: Bank)
      @bank = bank
      @customer = customer
      @product = product
      @purchase_klass = purchase_klass
    end

    def checkout
      purchase_klass.complete(customer: customer, product: product)
      bank.bill(customer_name: customer.name, amount: product.price)
    end
  end
end
