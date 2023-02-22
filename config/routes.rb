Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: 'v1/hotels#index'  
  resources :hotels, :rooms, :employees

  namespace :v1 do 
    resources :hotels
    resources :rooms 
    resources :employees
  end


end