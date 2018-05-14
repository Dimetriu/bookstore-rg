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

    devise_for :admins
    devise_for :users, skip: :omniauth_callbacks, controllers: {
      confirmations: 'users/confirmations',
      passwords: 'users/passwords',
      registrations: 'users/registrations',
      sessions: 'users/sessions'
    }

    get 'settings', action: :index, controller: 'settings'
    put 'update_email', action: :update_email, controller: 'settings'
    patch 'update_password', action: :update_password, controller: 'settings'
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
