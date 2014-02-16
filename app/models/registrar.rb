require_relative 'user'

class Registrar
  attr_reader :credentials, :user_info, :user_list
  def initialize(user_info: nil, credentials: nil, user_list: User)
    @user_info = user_info
    @credentials = credentials
    @user_list = user_list
  end

  def user
    persisted_user = user_list.find_by_email(user_info.email)
    persisted_user.nil? ? create_user : persisted_user
  end

  private

  def create_user
    user = user_list.new(email: user_info.email,
      name: user_info.full_name,
      uid: user_info.uid)

    user.save && user || NullUser.new
  end

  class NullUser
    def null
      nil
    end
    alias :email :null
    alias :id :null
    alias :name :null
  end
end
