Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :registrations, only: [:create]
      resources :sessions, only: [:create]
      resources :teachers, only: [:create]
      resources :admins, only: [:create]

    end
  end
end
