Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # Custom route for plan index
  Rails.application.routes.draw do
    # Additional routes for plans
    get 'plans' => 'plans#index'
    get 'plans/new' => 'plans#new'
    post 'plans/new' => 'plans#create'
    #追加
    get 'plans/calendar' => 'plans#calendar'
    root to: 'plans#calendar'
    
    resources :plans # これはendの上に書く
  end
end

