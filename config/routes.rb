require 'sidekiq'
require 'sidekiq/web'

Rails.application.routes.draw do

  mount Sidekiq::Web => '/sidekiq'

  get 'dashboard/index'
  get 'reports/balance'
  resources :payments
  devise_for :users

  resources :debts

  resources :people do
    collection do
      get :search
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root 'dashboard#index'

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  
end
