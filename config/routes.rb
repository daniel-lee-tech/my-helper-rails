# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'users#login'
  get 'users/login', to: 'users#login', as: 'login'
  get 'users/signup', to: 'users#signup'
  get 'login', to: 'users#login'
  get 'signup', to: 'users#signup', as: 'signup'
  post 'users/login', to: 'users#authenticate', as: 'authenticate'
  post 'users/signup', to: 'users#create', as: 'create_user'
end
