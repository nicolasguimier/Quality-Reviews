Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :contacts, only: [:new, :create]
  resources :organisations, only: [:index, :show, :new, :create, :edit, :update, :destroy]


end
