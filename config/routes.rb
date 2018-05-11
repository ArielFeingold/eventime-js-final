Rails.application.routes.draw do
  resources :comments, only: [:create, :edit, :update]
  resources :events
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy] do
      resources :events
    end
  resources :rsvps, only: [:create, :destroy]

  root 'static_pages#home'

  get '/auth/facebook/callback' => 'sessions#create'
  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
end
