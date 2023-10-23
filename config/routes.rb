# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tasks
  devise_for :users

  put 'tasks/:id/complete', to: 'tasks#complete'
  put 'tasks/:id/uncomplete', to: 'tasks#uncomplete'

  put 'tasks/:id/start', to: 'tasks#start_timer'
  put 'tasks/:id/stop', to: 'tasks#stop_timer'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root to: 'home#index'
end
