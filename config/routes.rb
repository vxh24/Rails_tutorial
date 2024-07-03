Rails.application.routes.draw do

  get '/login',to: 'sessions#new'
  get '/logout',to: 'sessions#destroy'
  post '/login',to: 'sessions#create'
  delete '/logout',to:'sessions#destroy'
  resources :productts
  get 'demo_partials/new'
  get 'demo_partials/edit'
  get 'static_pages/home'
  get 'static_pages/help'
  resources :users
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  resources :users, only: %i(new create show)

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root 'static_pages/home'
end
