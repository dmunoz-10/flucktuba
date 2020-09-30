require 'sidekiq/web'

Rails.application.routes.draw do
  authenticate :admin_user, lambda { |u| u.email } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :users, only: :show do
    delete :remove_avatar, on: :collection
  end
  resource :profile, only: :update

  root to: 'pages#home'
end
