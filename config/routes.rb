Rails.application.routes.draw do
  resources :events
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :sessions, only: [:new, :create, :destroy]

  root 'static_pages#home'

  get '/auth/facebook/callback' => 'sessions#create'
  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
end
