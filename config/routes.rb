# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: 'v1/hotels#index'

  namespace :v1 do
    resources :hotels
    resources :rooms
    resources :employees
    resources :roles
    resources :bookings do
      collection do
        get :available_rooms
        get :booked_rooms
      end
    end
    resources :guests
    get '/status', to: 'status#index'
  end
end