Rails.application.routes.draw do
  resources :user_classes
  resources :dance_classes
  resources :likes
  resources :comments
  resources :users
  get 'me/dance_classes', to: 'dance_classes#my_dance_classes'


  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :update]
      patch '/users/:id', to: 'users#update'
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end

end
