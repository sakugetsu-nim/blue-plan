Rails.application.routes.draw do
  #devise_for :users

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Custom routes for plans
  get 'plans' => 'plans#index'
  get 'plans/index' => 'plans#index'
  get 'plans/new' => 'plans#new'
  post 'plans' => 'plans#create' # ルートを変更してリソースルーティングに準拠させる
  get 'plans/calendar' => 'plans#calendar', as: :plans_calendar

  # Root path
  root to: 'plans#calendar'

  # Resource routes for plans
  resources :plans

  # 追加
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
