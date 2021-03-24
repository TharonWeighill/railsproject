Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'home#signup'
  
  resources :restaurant, only: [:new, :show] do

  #super admin
  resources :gm do 
    resources :kitchen_notes
    resources :dining_notes
  end
  
  #admins
  resources :agm do
    resources :dining_preps
  end 
  resources :chef do
    resources :kitchen_preps
  end

  #users
  resources :cook
  resources :server
  
end