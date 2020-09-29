require 'sidekiq/web'

Rails.application.routes.draw do
  authenticate :admin_user, lambda { |u| u.email } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resource :profile

  root to: 'pages#home'
end
