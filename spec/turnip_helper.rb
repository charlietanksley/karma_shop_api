require 'turnip/capybara'
require_relative 'rails_spec_helper'
Dir.glob("spec/steps/**/*steps.rb") { |f| load f, true }

RSpec.configure do |config|
  config.before do
    SpecRedis.reset_database
  end

  config.after do
    SpecRedis.reset_database
  end
end

module SpecRedis
  def self.add_term_with_points(term, points)
    REDIS.zadd(StoreConfig::TERM_KEY, points, term)
  end

  def self.reset_database
    REDIS.del(StoreConfig::TERM_KEY)
  end
end
