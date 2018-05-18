Rails.application.routes.draw do

  # get 'users/index'
  # get 'users/edit'
  # get 'users/update_email'
  # get 'users/update_password'
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

    scope 'account' do
      resource :user, path: 'settings', only: :edit do
        patch :update_email
        patch :update_password
      end
    end
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
