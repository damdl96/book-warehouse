# frozen_string_literal: true

Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :inventories
  resources :stores
  resources :books

  root 'admin/dashboard#index'
end
