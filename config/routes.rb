Rails.application.routes.draw do
  resources :user_classes
  resources :dance_classes
  resources :likes
  resources :comments
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
