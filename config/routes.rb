Rails.application.routes.draw do
  get 'welcome/home'
  get 'welcome/app', to: 'welcome#app', as: 'app'
  root 'welcome#home'
  #auth
  # resource :users, only: [:create, :show]
  post '/sign_up', to: 'users#create'
  post '/login', to: 'auth#create'
  get '/persist', to: 'auth#show'
  get '/wines/:variety/:country', to: 'wines#variety'
  get '/varietal_count', to: 'wines#varietal_count'
  get '/country_count', to: 'wines#country_count'
   
  resources :reviewed_wines
  resources :reviews
  resources :favorites
  resources :wines
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
