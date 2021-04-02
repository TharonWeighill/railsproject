Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :bartenders, except: [:index]
  resources :recipes do
    resources :category
  end 
  resources :ingredients, except: [:index, :show]
  resources :comments, only: [:new, :edit, :destroy]
end