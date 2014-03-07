class Api::ProductsController < ApplicationController
  respond_to :json

  def index
    @products = Product.all
    respond_with @products
  end

  def create
    @product = Product.new(create_params)
    if @product.save
      respond_with @product
    else
      render json: Hash[errors: @product.errors], status: 422
    end
  end

  private

  def create_params
    munger = HashMunger.new(params)
    ActionController::Parameters.new(munger.transform(keys: munger.standard_params_chain))
      .permit(:attribution_text, :attribution_url, :name, :price, :src)
      .symbolize_keys
  end
end
