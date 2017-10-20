Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'

  # get '/', :to => 'welcome#index', :as => 'welcome'

  resources :items, only: [:index, :show]
  # resources :categories, only: [:index, :show]
  resources :carts, only: [:create]
  resources :stores, only: [:index, :show]
  resources :users, only: [:new, :create, :update, :edit]

  resources :orders, only: [:index, :show, :create]

  namespace :admin do
    resources :dashboard, only: [:index]
    resources :users, only: [:edit, :update]
    resources :orders, only: [:show]
    resources :items, except: [:destroy]
    # get '/dashboard', to: "admindashboard#dashboard"
  end

  get "/dashboard", to: "users#show"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/auth/twitter", to: "sessions#create"
  get "/auth/twitter/callback", to: "sessions#create"

  get '/password-reset', to: 'passwords#show'
  post '/password-reset', to: 'passwords#reset'
  patch '/password-reset/update', to: 'passwords#update', as: 'edit_password'

  get '/password-confirmation', to: 'confirmations#new', as: 'new_confirmation'

  get '/cart', to: "carts#index", as: "cart"
  delete '/cart/:id', to: "carts#destroy", as: "cart_remove_item"
  put '/cart/:id', to: "carts#update", as: "cart_add_item"

  post '/orders/cancel/:order_id', to: "orders#cancel", as: "order_cancel"
  post '/orders/paid/:order_id', to: "orders#paid", as: "order_paid"
  post '/orders/completed/:order_id', to: "orders#completed", as: "order_completed"
  get '/:category_name', to: 'categories#show'

end
