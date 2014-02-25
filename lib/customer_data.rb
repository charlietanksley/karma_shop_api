require_relative 'customer_data/storage'

module CustomerData
  module Config
    TERM_KEY = ENV['REDIS_TERM_KEY'] || 'lita:handlers:karma:terms'
  end

  def self.available_karma(term)
    storage = Storage.new
    storage.available_karma(term)
  end
end
