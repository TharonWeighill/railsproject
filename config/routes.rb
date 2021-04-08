Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  
  resources :bartenders, except: [:index]
  resources :recipes do
    resources :catagories, only: :index
  end 
  resources :ingredients, except: [:index, :show, :update, :edit, :delete]
  resources :comments, only: [:new, :edit, :destroy]
end