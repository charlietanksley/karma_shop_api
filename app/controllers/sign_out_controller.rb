class SignOutController < ApplicationController
  def destroy
    reset_session
    redirect_to new_sign_in_path
  end
  alias :show :destroy
end
