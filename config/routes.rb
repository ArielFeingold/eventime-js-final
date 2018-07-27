Rails.application.routes.draw do

  resources :comments, only: [:create, :edit, :update, :new]
  resources :events do
    resources :locations, only: :show
  end
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy] do
      resources :events
      resources :locations
    end
  resources :rsvps, only: [:create, :destroy, :index]

  resources :locations, only: :show

  root 'static_pages#home'

  get '/auth/facebook/callback' => 'sessions#create'
  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
end
