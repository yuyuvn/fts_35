Rails.application.routes.draw do

  authenticated :user do
    root to: "exams#new", as: "authenticated_root"
  end
  unauthenticated do
    root "static_pages#home"
  end

  devise_for :users

  resources :users, only: :show

  resources :exams, except: [:index, :destroy]
  namespace :admin do
    root "users#index"
    resources :imports, only: :create
    resources :users, except: [:show]
    resources :categories do
      resources :questions
    end
  end

end
