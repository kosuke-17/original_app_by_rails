Rails.application.routes.draw do
  devise_for :users
  root to: "words#index"
  resources :words do
    resources :comments, only: :create
    collection do
      get 'search'
    end 
  end
  resources :users, only: [:index, :show, :edit, :update] do
    collection do
      get 'search'
    end
  end
end
