Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  root to: 'songs#index'

  resources :contact_forms, only: [:new, :create]
  resources :broken_link_reports
  resources :songs
  resources :restricted_category_sessions
  get 'donation_thank_you', to: 'thank_you#donation'
  get 'purchase_thank_you', to: 'thank_you#purchase'
  get 'sacred', to: 'restricted_category_sessions#new', as: :sacred_password
  get 'donations', to: 'donations#new'
end
