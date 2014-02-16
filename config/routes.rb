KarmaShopApi::Application.routes.draw do
  get '/auth/:provider/callback/', to: 'sessions#create'
  resource :sign_in, only: [:new], controller: 'sign_in'
  resource :sign_out, only: [:show, :destroy], controller: 'sign_out'

  namespace :api do
    resource :potential_customers, only: [:show]
  end

  root 'web#show'
end
