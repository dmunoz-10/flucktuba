require 'sidekiq/web'

Rails.application.routes.draw do
  authenticate :admin_user, lambda { |u| u.email } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :users, path: '/t', only: :show do
    scope '/users' do
      delete :remove_avatar, on: :collection
    end
  end
  resource :profile, only: :update

  resources :flucks, except: %i[show index] do
    resources :rules, except: %i[index new show]

    put '/settings', to: 'fluck_settings#update', as: 'settings', on: :member

    resources :tubas, except: %i[new edit show]
  end

  get '/:id', to: 'flucks#show', as: :show_flucks

  root to: 'pages#home'
end
