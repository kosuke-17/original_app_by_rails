Rails.application.routes.draw do
  devise_for :users
  root to: "words#index"
  resources :words do
    resources :comments, only: :create 
  end
  resources :users, only: :show
end
