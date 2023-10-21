# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tasks
  devise_for :users

  put 'tasks/:id/complete', to: 'tasks#complete'
  put 'tasks/:id/uncomplete', to: 'tasks#uncomplete'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root to: 'home#index'
end
