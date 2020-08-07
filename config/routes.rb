Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  # get 'tasks/show'
  get 'project/index'
  # get 'projects/show'

  resources :project do
    resources :task, only: [:show]
  end

end
