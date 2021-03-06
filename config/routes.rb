Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users, :controllers => { registrations: 'users/registrations' }

    namespace :admin do
      resources :trains do
        resources :carriages, only: [:new, :create]
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
    end

    resource :search, only: :show do
      get :result
    end

    resources :tickets, except: [:update, :edit]
    get 'welcome/index'
    root 'welcome#index'
  end
end