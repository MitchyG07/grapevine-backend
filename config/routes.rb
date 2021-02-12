Rails.application.routes.draw do
  resources :reviewed_wines
  resources :reviews
  resources :favorites
  resources :wines
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
