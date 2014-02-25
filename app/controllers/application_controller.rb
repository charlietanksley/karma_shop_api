class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :null_session

  before_filter :authenticate!

  def authenticate!
    current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to '/auth/stable'
  end
  helper_method :current_user

  def current_user=(user)
    session[:user_id] = user.id
  end

  private

  def customer_name_params
    params.permit(:customerName).reduce({}) { |acc, (k,v)|
      acc[k.to_s.underscore.to_sym] = v
      acc
    }
  end
end
