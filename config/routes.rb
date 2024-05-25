Rails.application.routes.draw do
  get 'users/show'

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Custom routes for plans
  get 'plans' => 'plans#index'
  get 'plans/index' => 'plans#index'
  get 'plans/new' => 'plans#new'
  post 'plans' => 'plans#create'
  get 'plans/calendar' => 'plans#calendar', as: :plans_calendar

  # Root path
  root to: 'plans#calendar'

  # Resource routes for plans
  resources :plans

  # Devise routes for users
  devise_for :users, controllers: { registrations: 'users/registrations' }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get "users/profile" => "users#show"
end
