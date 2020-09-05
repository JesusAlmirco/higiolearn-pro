Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root home route
  root 'pages#home'
  #get '/about' => 'pages#terms' disable this function for temporary
  get '/terms_privacy' => 'pages#terms_privacy'

  #admin user login route
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  #user registrations route - devise gem
  devise_for :users

  # get 'tasks/show'
  get 'project/index'

  #get myproject/list
  get '/myprojects' => 'project#list'

  #subscriptions route
  post '/free' => 'charge#free'
  #subscription with stripe route
  post '/pay' => 'charge#pay'
  # get 'projects/show'
  resources :project do
    resources :task, only: [:show]
  end

  #get reviews to project
  resources :project do
    resources :reviews, only: [:create, :destroy]
  end

end
