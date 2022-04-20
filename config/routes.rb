Rails.application.routes.draw do
  resources :trains do
    resources :carriages, only: [:new, :create]
    resources :tickets, only: [:index, :create]
    get :ticket_buy, to:  'tickets#buy', as: :ticket_buy
    # post :ticket_buy, to:  'tickets#create'
  end
  resources :railway_stations do
    patch :update_position, on: :member
    patch :update_time, on: :member
  end
  resources :routes do
    post :add_railway_station, on: :member
    delete :remove_railway_station, on: :member
  end
  resources :carriages, only: :show

  resource :search, only: :show do
    get :result
  end

  resources :tickets, only: :show
  get 'welcome/index'
  root 'welcome#index'
end