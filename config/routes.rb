Rails.application.routes.draw do
  resources :trains
  resources :railway_stations
<<<<<<< HEAD
  resources :routes
  resources :carriages

=======
>>>>>>> using scaffold for creating CRUD for railway_stations and trains
  get 'welcome/index'

  root 'welcome#index'
end
