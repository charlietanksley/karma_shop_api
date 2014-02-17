require 'turnip/capybara'
require_relative 'rails_spec_helper'
Dir.glob("spec/steps/**/*steps.rb") { |f| load f, true }
