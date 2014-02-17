require 'turnip/capybara'
require_relative 'rails_spec_helper'
Dir.glob("spec/steps/**/*steps.rb") { |f| load f, true }
ENV['REDIS_TERM_KEY'] = 'lita:handlers:karma:terms:testing'

RSpec.configure do |config|
  config.before do
    SpecRedis.reset_database
  end

  config.after do
    SpecRedis.reset_database
  end
end

module SpecRedis
  require File.join(Rails.root, 'lib/customer_data')

  def self.add_term_with_points(term, points)
    REDIS.zadd(CustomerData::Config::TERM_KEY, points, term)
  end

  def self.reset_database
    REDIS.del(CustomerData::Config::TERM_KEY)
  end
end
