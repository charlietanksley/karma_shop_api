require 'spec_helper'

require 'capybara/rails'
require 'capybara/rspec'

# ActiveRecord
require "yaml"
require "active_record"
ActiveRecord::Base.establish_connection(
  YAML.load(File.read("config/database.yml"))["test"]
)

# DatabaseCleaner
require "database_cleaner"

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end
  config.before(:each) do
    DatabaseCleaner.start
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end
end

# Enter database configurations into ActiveRecord
ActiveRecord::Base.send(:configurations=, YAML::load(ERB.new(IO.read("config/database.yml")).result))
