Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#home'
  resources :bartenders, except: [:index]
  resources :categories, only: :show do
    resources :recipes
  end 
  resources :ingredients, except: [:index, :show, :update, :edit, :delete]
  resources :comments, only: [:new, :edit, :destroy]
end