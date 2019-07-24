Rails.application.routes.draw do
  get 'items/orders'
  get 'items/restaurants'
  devise_for :users
  root to: 'restaurants#show'

  # test routes for getting to specific views
  get "/cart", to: , as: 
  get "/pay", to: , as: 
  get "/feedback", to: , as: 


  #1 after scanning a new order will be created, than redicrection to 'show restaurants items'
  get "/tables/:id/orders/new", to: 'orders#new'
  post "/tables/:id/orders", to: 'orders#create'

#display the items of the restaurant
# restaurants/1
resources :restaurants, only: [:show] do

  #display a specific item
  # restaurants/1/items/:id
  resources :items, only: [:show]
  #possibility to update/update/destroy
  # restaurants/1/items/:id/show
  resources :orders, only: [:show, :update, :destroy]
 end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
