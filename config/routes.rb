Rails.application.routes.draw do
  get 'welcome/home'
  get 'welcome/app', to: 'welcome#app', as: 'app'
  root 'welcome#home'
  #auth
  resource :users, only: [:create]
  post "/login", to: "auth#login"
   get "/auto_login", to: "auth#auto_login"
   get "/user_is_authed", to: "auth#user_is_authed"
   
  resources :reviewed_wines
  resources :reviews
  resources :favorites
  resources :wines
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
