class Api::CustomerTreasuresController < ApplicationController
  respond_to :json

  def show
    @customer_treasures = CustomerTreasures.for(customer_name_params[:customer_name])

    respond_with @customer_treasures
  end
end
