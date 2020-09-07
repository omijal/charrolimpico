# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'

  get 'signup', to: 'users#new'
  resources :users, except: %i[new destroy index]
  get 'dashboard', to: 'pages#dashboard'

  get '/users', to: 'users#new'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'logout', to: 'sessions#destroy'

  scope :admin do
    resources :organizations
  end

  resources :organizations do
    resources :categories, only: %i[new create]
    resources :problems, only: %i[new create]
    resources :careers, only: %i[new create]
  end

  resources :careers do
    resources :enrollments, only: %i[new create]
    resources :courses, only: %i[new create]
  end

  resources :course
  resources :task
end
