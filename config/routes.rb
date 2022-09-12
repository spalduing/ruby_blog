# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             controllers: { sessions: 'users/sessions', registrations: 'users/registrations',
                            confirmations: 'users/confirmations', passwords: 'users/passwords',
                            unlocks: 'users/unlocks' }

  root 'articles#index'

  resources :articles do
    resources :comments
  end

  resources :users
  post '/articles/:id/follow', to: 'articles#follow', as: 'follow_user'
  post '/articles/:id/unfollow', to: 'articles#unfollow', as: 'unfollow_user'
  get '/articles/:id/followers', to: 'articles#followers', as: 'user_followers'
  get '/articles/:id/followings', to: 'articles#followings', as: 'user_followings'
end
