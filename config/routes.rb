Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "events#index"

  resource :user
  resolve('User') { [:user] }

  resources :events do 
    resources :event_guests, only: [:create, :destroy]
  end
  resource :user do 
    resources :events 
  end
end
