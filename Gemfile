source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use postgresql as the database for Active Record
gem 'pg'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

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
  gem 'rspec-rails', '~>3.0.0beta1'
  # use the version from git for not b/c earlier turnip seems to not
  # want to work with rspec 3
  gem 'turnip', git: 'git@github.com:jnicklas/turnip.git'
end

# Use unicorn as the app server
gem 'unicorn'
