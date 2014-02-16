class SessionsController < ApplicationController
  skip_before_action :authenticate!

  def create
    user_info, credentials = OmniauthResponseParser.parse(
      request.env['omniauth.auth'])
    registrar = Registrar.new(user_info: user_info,
      credentials: credentials)

    self.current_user = registrar.user

    redirect_to root_path
  end

  module OmniauthResponseParser
    def self.parse(auth_hash)
      auth = Hashie::Mash.new(auth_hash)
      user_info = Hashie::Mash.new(auth.info.merge(uid: auth.uid))
      credentials = Hashie::Mash.new(auth.credentials)

      [user_info, credentials]
    end
  end
end
