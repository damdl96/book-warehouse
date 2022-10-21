# frozen_string_literal: true

Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :inventories, only: %i[index create update]
  resources :books, only: %i[create destroy]

  root 'admin/dashboard#index'
end
