Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      namespace :student do
        resources :registrations, only: [:create]
        resources :sessions, only: [:create]
      end

      namespace :teacher do
        resources :sessions, only: [:create]
      end

      namespace :admin do
        resources :sessions, only: [:create]
        resources :classrooms, only: [:create]
        resources :courses, only: [:create]
        resources :edlevels, only: [:create]
        resources :sections, only: [:create]
        resources :subjects, only: [:create]
        resources :timetables, only: [:create]
      end
    end
  end
end
