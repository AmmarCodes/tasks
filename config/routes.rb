# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tasks
  devise_for :users

  put 'tasks/:id/complete', to: 'tasks#complete'
  put 'tasks/:id/uncomplete', to: 'tasks#uncomplete'

  put 'tasks/:id/start', to: 'tasks#start_timer'
  put 'tasks/:id/stop', to: 'tasks#stop_timer'

  root to: 'application#index'
  match '*path', to: 'application#index', via: :get
end
