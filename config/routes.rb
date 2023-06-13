# frozen_string_literal: true

Rails.application.routes.draw do
  resources :events
  get 'home/index'
  get 'my_events', to: 'events#my_events'
  get 'search', to: 'events#search'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'events#index'
end
