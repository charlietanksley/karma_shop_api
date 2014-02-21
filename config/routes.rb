KarmaShopApi::Application.routes.draw do
  get '/auth/:provider/callback/', to: 'sessions#create'
  resource :sign_in, only: [:new], controller: 'sign_in'
  resource :sign_out, only: [:show, :destroy], controller: 'sign_out'

  namespace :api do
    resource :potential_customers, only: [:show]
    resource :customer_treasures, only: [:show]
    resource :stores, only: [:show]
  end

  root 'web#show'
  match '*path', to: "web#show", via: [:get, :post]
end
