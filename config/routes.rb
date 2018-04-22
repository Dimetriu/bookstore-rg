Rails.application.routes.draw do
  devise_for :admins
  get '/:locale' => 'home#index'
  root 'home#index'
  
  scope '(:locale)' do
    devise_for :users
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
