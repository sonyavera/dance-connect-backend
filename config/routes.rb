Rails.application.routes.draw do
  resources :user_classes
  resources :dance_classes
  resources :users
  get 'me/dance_classes', to: 'dance_classes#my_dance_classes'
  get 'unique_dance_classes', to: 'dance_classes#unique_classes'
  get 'dance_classes/:dance_class_id/comments', to: 'dance_classes#comments'

  # resources :dance_classes do
  #   resource :comments
  # end

  resources :comments do
    resources :comments
  end


  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :update]
      patch '/users/:id', to: 'users#update'
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end

end
