Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root home route
  root 'pages#home'

  #admin user login route
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  #user registrations route - devise gem
  devise_for :users

  # get 'tasks/show'
  get 'project/index'

  #subscriptions route
  post '/free' => 'charge#free'

  # get 'projects/show'
  resources :project do
    resources :task, only: [:show]
  end

end
