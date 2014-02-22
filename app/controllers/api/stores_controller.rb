class Api::StoresController < ApplicationController
  respond_to :json

  def show
    customer_name = customer_name_params[:customer_name]
    customer = Store::Customer.new(customer_name: customer_name)
    products = Store::Products.new(customer_name: customer_name).all
    @store = Store::CustomerStore.new(customer: customer,
      products: products)

    respond_with @store
  end
end
