class Api::PurchasesController < ApplicationController
  respond_to :json

  def create
    funnel = Checkout::Funnel.new(create_purchase_params)
    cashier = Checkout::Cashier.new(customer: funnel.customer,
      product: funnel.product)
    cashier.checkout

    customer_name = customer_name_params[:customer_name]
    customer = Store::Customer.new(customer_name: customer_name)
    products = Store::Products.new(customer_name: customer_name).all
    @store = Store::CustomerStore.new(customer: customer,
      products: products)

    respond_with @store, location: api_stores_path('customerName' => create_purchase_params[:customer_name])
  end

  private

  def create_purchase_params
    params.permit(:productId).reduce({}) { |acc, (k,v)|
      acc[k.to_s.underscore.to_sym] = v
      acc
    }.merge(customer_name_params)
  end
end
