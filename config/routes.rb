Rails.application.routes.draw do
  get 'welcome/home'
  get 'welcome/app', to: 'welcome#app', as: 'app'
  root 'welcome#home'
  #auth
  resource :users, only: [:create]
  post '/sign_up', to: 'users#create'
  post '/login', to: 'auth#create'
  get '/persist', to: 'auth#show'
   
  resources :reviewed_wines
  resources :reviews
  resources :favorites
  resources :wines
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
