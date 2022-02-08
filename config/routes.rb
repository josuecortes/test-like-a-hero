Rails.application.routes.draw do
  resources :enemies, only: [:update, :destroy]
  resources :weapons, only: [:index, :show, :create, :destroy]
  resources :users, only: [:index, :create]
end
