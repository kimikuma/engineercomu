Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "homes#top"
  resources :users do
   resource :relationships
   get "users/following"=>"relationships#followings"
   get "users/followers"=>"relationships#followers"
  end

  resources :posts do
   resource :favorites
  end


  resources :chats
  get 'rooms/index'

  resources :groups do
   resource :group_users
   resources :group_chats
  end

  resources :notifications,only: [:update]

  get "/search"=>"searchs#search"

  devise_scope :user do
    post "users/guest_sign_in"=>"users/sessions#guest_login"
  end
end
