source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'
gem 'rails', '~> 5.2.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'mini_racer', platforms: :ruby

gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.4'
gem 'jquery-rails'
gem 'omniauth', '~> 1.8', '>= 1.8.1'
gem 'omniauth-facebook', '~> 5.0'
gem 'devise', '~> 4.4', '>= 4.4.3'
gem 'rails_admin', '~> 1.3'
gem 'cancancan', '~> 2.2'
gem 'simple_form', '~> 4.0'
gem 'country_select', '~> 3.1', '>= 3.1.1'
gem 'haml-rails', '~> 1.0'

gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
# gem 'redis', '~> 4.0'
# gem 'bcrypt', '~> 3.1.7'

gem 'mini_magick', '~> 4.8'

# gem 'capistrano-rails', group: :development

gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  %w[rspec-core rspec-expectations rspec-mocks rspec-rails rspec-support].each do |lib|
    gem lib, :git => "https://github.com/rspec/#{lib}.git", :branch => 'master'
  end
  gem 'rspec_junit_formatter', '~> 0.3.0'
  gem 'factory_bot'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '~> 3.0', '>= 3.0.2'
  gem 'capybara-webkit', '~> 1.15'
  gem 'database_cleaner', '~> 1.6', '>= 1.6.2'
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.2'
  gem 'ffaker', '~> 2.9'
end
