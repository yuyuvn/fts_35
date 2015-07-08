Rails.application.routes.draw do

  root "static_pages#home"

  devise_for :users

  resources :users, only: :show

  namespace :admin do
    root "users#index"
    resources :users, except: [:show, :new, :create]
    resources :categories, only: :index
  end

end
