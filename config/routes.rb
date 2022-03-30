Rails.application.routes.draw do
  resources :trains do
    resources :carriages, only: [:new, :create]
  end
  resources :railway_stations do
    patch :update_position, on: :member
  end
  resources :routes
  resources :carriages, only: [:show]

  get 'welcome/index'

  root 'welcome#index'
end