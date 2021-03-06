Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 
  root 'sessions#home'
  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  get '/categories', to: 'recipes#categories'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'

  resources :comments, only: [:create, :edit, :update, :destroy]
  resources :recipes, only: [:new, :index, :create]
  resources :bartenders, except: [:index] do
    resources :recipes, shallow: true 


  
  end 
end