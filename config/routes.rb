# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :tasks

  root to: 'tasks#index'
end
