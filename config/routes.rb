Rails.application.routes.draw do
  devise_for :users
  root 'public_recipes#index'
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, only: [:index, :show, :new, :create, :destroy, :update] do
    resources :recipe_foods, only: [:new, :create, :destroy]
  end
  resources :public_recipes, only: [:index]
  resources :general_shopping_lists, only: [:index], path: :general_shopping_list
end
