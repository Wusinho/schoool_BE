Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :registrations, only: [:create]
      resources :sessions, only: [:create]
      resources :teachers, only: [:create]
      resources :admins, only: [:create]

      namespace :admin do
        resources :classrooms, only: [:create]
        resources :courses, only: [:create]
        resources :edlevels, only: [:create]
        resources :sections, only: [:create]
        resources :subjects, only: [:create]
        resources :teachers, only: [:create]
        resources :timetables, only: [:create]
      end
    end
  end
end
