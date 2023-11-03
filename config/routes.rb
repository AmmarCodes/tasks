# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  namespace :api, defaults: { format: :json } do
    resources :tasks

    put 'tasks/:id/complete', to: 'tasks#complete'
    put 'tasks/:id/uncomplete', to: 'tasks#uncomplete'

    put 'tasks/:id/start', to: 'tasks#start_timer'
    put 'tasks/:id/stop', to: 'tasks#stop_timer'
  end

  root to: 'application#index'
  match '*path', to: 'application#index', via: :get
end
