Rails.application.routes.draw do

  get 'relationships/create'
  get 'relationships/destroy'
  root 'tweets#index'
  devise_for :users
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member # 追加
    get :followers, on: :member # 追加
  end

  resources :tweets do
    resource :favorites, only:[:create,:destroy]
  end
  resources :tweets do
    resource :comments, only:[:create,:destroy]
  end
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
