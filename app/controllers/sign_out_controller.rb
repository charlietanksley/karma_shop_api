class SignOutController < ApplicationController
  def destroy
    reset_session
    redirect_to root_path
  end
  alias :show :destroy
end
