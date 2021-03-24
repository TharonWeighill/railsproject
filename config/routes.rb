Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#signup'
  resources :restaurant
  resources :gm
  resources :agm
  resources :chef
  resources :cook
  resources :server
  resources :kitchen_notes
  resources :kitchen_preps
  resources :dining_notes
  resources :dining_preps
end
