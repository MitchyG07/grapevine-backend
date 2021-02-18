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
  get '/varietal_count/:variety', to: 'wines#varietal_count'
  get '/country_count/:variety', to: 'wines#country_count'
  # get '/reviews/:user_id', to: 'reviews#user_reviews'
   
  
  resources :reviews, except: :show
  resources :favorites
  resources :wines
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
