Rails.application.routes.draw do
  get ':/locale', to: 'home#index'
  root 'home#index'
  
  devise_for :users, only: :omniauth_callbacks, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  scope '(:locale)' do
    devise_for :admins
    devise_for :users, skip: :omniauth_callbacks, controllers: {
      confirmations: 'users/confirmations',
      passwords: 'users/passwords',
      registrations: 'users/registrations',
      sessions: 'users/sessions'
    }
  end
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
