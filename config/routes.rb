# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root 'articles#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :articles do
    resources :comments
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
