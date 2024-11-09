Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "homes#top"
  resources :users

  devise_scope :user do
    post "users/guest_sign_in"=>"users/sessions#guest_login"
  end
end
