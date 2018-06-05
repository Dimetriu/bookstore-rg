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

    resources :categories, only: :show, param: :name

    devise_for :admins
    devise_for :users, skip: :omniauth_callbacks

    scope 'account' do
      resources :users, path: 'settings', only: [:index, :destroy] do
        resources :addresses, except: [:index, :show, :destroy]
        patch :update_email
        patch :update_password
      end
    end
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
