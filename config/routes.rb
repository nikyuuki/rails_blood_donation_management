Rails.application.routes.draw do
  devise_for :users
  devise_for :admins, controllers: { registrations: 'admins/registrations' }

  get "home/index"

  root to: 'home#index'


  resources :donors
  resources :staffs
  resources :appointments
  resources :bagbloods
  get 'home/dashboard', to: 'home#dashboard', as: 'home_dashboard'
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
