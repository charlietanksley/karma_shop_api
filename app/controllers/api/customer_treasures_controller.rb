class Api::CustomerTreasuresController < ApplicationController
  respond_to :json

  def show
    @customer_treasures = CustomerTreasures.for(show_params[:customer_name])

    respond_with @customer_treasures
  end

  private

  def show_params
    params.permit(:customerName).reduce({}) { |acc, (k,v)|
      acc[k.to_s.underscore.to_sym] = v
      acc
    }
  end
end
