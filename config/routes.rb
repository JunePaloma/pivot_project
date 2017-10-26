Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'

  # get '/', :to => 'welcome#index', :as => 'welcome'

  resources :items, only: [:index, :show]

  resources :carts, only: [:create]
  resources :categories, only: [:show], param: :category_name
  resources :stores, only: [:index]
  resources :users, only: [:new, :create, :update, :edit]

  resources :orders, only: [:index, :show, :create]

  resources :store_requests, only: [:new, :create, :index]

  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index]
    end
  end

  namespace :admin do
    resources :dashboard, only: [:index]
    resources :orders, only: [:show, :index]
    resources :items, except: [:destroy]
    resources :stores, only: [:edit, :update]
    resources :operators
    resources :store_requests, only: [:index]
    # get '/dashboard', to: "admindashboard#dashboard"
  end


  get "/operator_login", to: "operatorsesh#new"
  post "/operator_login", to: "operatorsesh#create"
  get "/operator_logout", to: "operatorsesh#destroy"

  get "/dashboard", to: "users#show"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/auth/twitter", to: "sessions#create"
  get "/auth/twitter/callback", to: "sessions#create"

  get '/password-reset', to: 'passwords#new', as: 'new_password_reset'
  post '/password-reset', to: 'passwords#create', as: 'password_reset'

  get '/password-confirmation', to: 'confirmations#new', as: 'new_password'
  post '/password-confirmation', to: 'passwords#update', as: 'edit_password'

  get '/cart', to: "carts#index", as: "cart"
  delete '/cart/:id', to: "carts#destroy", as: "cart_remove_item"
  put '/cart/:id', to: "carts#update", as: "cart_add_item"

  post '/orders/cancel/:order_id', to: "orders#cancel", as: "order_cancel"
  post '/orders/paid/:order_id', to: "orders#paid", as: "order_paid"
  post '/orders/completed/:order_id', to: "orders#completed", as: "order_completed"

  post '/store_requests/approve/:store_request_id', to: 'admin/store_requests#approve', as: 'approve_store_request'
  post '/store_requests/decline/:store_request_id', to: 'admin/store_requests#decline', as: 'decline_store_request'  

  get '/:store_slug', to: 'stores#show', as: 'store'
end
