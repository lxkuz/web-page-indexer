# frozen_string_literal: true
Rails.application.routes.draw do
  get 'swagger_editor', to: 'swag#editor'
  get 'swagger', to: 'swag#ui'

  resources :pages, only: [:index, :create], path: '/'
end
