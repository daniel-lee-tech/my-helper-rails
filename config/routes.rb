# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'users#login'
  get 'users/login', to: 'users#login'
  post 'users/login', to: 'users#authenticate'
end
