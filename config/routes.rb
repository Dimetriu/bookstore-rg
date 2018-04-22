Rails.application.routes.draw do
  get '/:locale' => 'home#index'
  root 'home#index'
  
  scope '(:locale)' do
    devise_for :admins, controllers: { sessions: 'sessions' }
    devise_for :users
  end

  mount RailsAdmin::Engine => '(:loacle)/dashboard', as: 'rails_admin'
end
