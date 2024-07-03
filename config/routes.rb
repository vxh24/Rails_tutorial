Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  get '/login',to: 'sessions#new'
  get '/logout',to: 'sessions#destroy'
  post '/login',to: 'sessions#create'
  delete '/logout',to:'sessions#destroy'
  resources :productts
  get 'demo_partials/new'
  get 'demo_partials/edit'
  get '/home',to: 'static_pages#home'
  get '/help',to: 'static_pages#help'

  get "/signup",to: "users#new"
  post "/edit",to: "users#edit"
  post "signup",to: "users#create"
  resources :users
  resources :users,only: [:destroy,:show, :edit,:index,:update]
  resources :account_activations, only: :edit
  resources :password_resets, only: %i(new create edit update)
  resources :microposts, only: %i(create destroy)
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships,only: %i(create destroy)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'static_pages#home'
end
