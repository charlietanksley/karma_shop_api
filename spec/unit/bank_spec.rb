require 'spec_helper'
require_relative '../../app/models/bank'

describe Bank do
  describe 'billing a customer' do
    let(:customer_name) { 'name' }
    let(:amount) { 10 }
    let(:storage) { double('CustomerData') }
    let(:bank) { Bank.new(customer_name: customer_name,
        karma_storage: storage) }

    it 'removes the specified amount from the account' do
      expect(storage).to receive(:charge_account)
        .with(term: customer_name, amount: amount)
      bank.bill(amount)
    end
  end
end
