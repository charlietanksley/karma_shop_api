source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use postgresql as the database for Active Record
gem 'pg'
gem 'redis'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# Authentication
gem 'omniauth'
gem 'omniauth-oauth2'
gem 'omniauth-stable', github: 'bignerdranch/omniauth-stable'

# Utilities
gem 'hashie' # make super-simple value objects

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'pry-rails'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'rspec-rails', '~>2.14.1'
  gem 'selenium-webdriver'
  gem 'turnip', '~>1.2.1'
end

# Use unicorn as the app server
gem 'unicorn'
