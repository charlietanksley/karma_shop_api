class Api::PotentialCustomersController < ApplicationController
  respond_to :json

  def show
    @potentialCustomers = PotentialCustomerList.alphabetical
    respond_with @potentialCustomers
  end
end
