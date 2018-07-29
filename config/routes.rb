Rails.application.routes.draw do
  get ':/locale', to: 'home#index'
  root 'home#index'

  devise_for :users, only: :omniauth_callbacks, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  scope '(:locale)' do
    get 'avatar/:size/:background/:text', to: Dragonfly.app.endpoint { |params, app|
      app.generate(
        :initial_avatar,
        URI.unescape(params[:text]), {
          size: params[:size],
          background_color: params[:background] })
          }, as: :avatar

          concern :addressable do
            member do
              resource :address, controller: 'address', only: [:create, :update]
            end
          end

          resources :categories, only: :show, param: :name

          resources :books, path: '/catalog', only: [:index, :show]

          resource :cart, controller: 'cart', only: :show

          resources :orders, only: [:show, :update]

          resources :order_items, only: [:create, :update, :destroy]

          devise_for :admins
          devise_for :users, skip: :omniauth_callbacks

    resources :users, concerns: :addressable, only: [:show, :destroy] do
      patch :update_email
      patch :update_password
    end

  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
