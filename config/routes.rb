KarmaShopApi::Application.routes.draw do
  get '/auth/:provider/callback/', to: 'sessions#create'
  resource :sign_in, only: [:new], controller: 'sign_in'
  resource :sign_out, only: [:show, :destroy], controller: 'sign_out'

  root 'sign_in#new'
end
