Rails.application.routes.draw do
  root 'items#index'
  get 'search', to: 'searches#index'
  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]
end
