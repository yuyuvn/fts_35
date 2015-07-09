Rails.application.routes.draw do

  root "static_pages#home"

  devise_for :users

  resources :users, only: :show

  resources :exams, except: [:index, :destroy]
  namespace :admin do
    root "users#index"
    resources :users, except: [:show, :new, :create]
    resources :categories do
      resources :questions
    end
  end

end
