Rails.application.routes.draw do
  devise_for :users
  root to: "words#index"
  resources :words, only: [:index, :destroy]
    #resources :comments, only: :create 
end
