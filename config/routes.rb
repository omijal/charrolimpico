# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'

  get 'signup', to: 'users#new'
  resources :users, except: %i[new destroy index]
  get 'dashboard', to: 'pages#dashboard'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'logout', to: 'sessions#destroy'
end
