Rails.application.routes.draw do
  devise_for :users

  # Root route - redirects based on authentication
  authenticated :user do
    root to: "pages#dashboard", as: :authenticated_root
  end

  unauthenticated do
    root to: "devise/sessions#new", as: :unauthenticated_root
  end

  # Dashboard route for authenticated users
  get 'dashboard', to: 'pages#dashboard'

  # Events routes
  resources :events

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"

  # Fallback para rotas antigas
  get '/home', to: redirect('/')
  get '/pages/home', to: redirect('/')
end
