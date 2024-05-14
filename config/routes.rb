Rails.application.routes.draw do
  #devise_for :users

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Custom routes for plans
  get 'plans' => 'plans#index'
  get 'plans/index' => 'plans#index'
  get 'plans/new' => 'plans#new'
  post 'plans/new' => 'plans#create'
  get 'plans/calendar' => 'plans#calendar'
  post 'plans/calendar' => 'plans#create'

  # Root path
  root to: 'plans#calendar'

  # Resource routes for plans
  resources :plans

  # Additional routes can be added here

  #追加
  devise_for :users
end
