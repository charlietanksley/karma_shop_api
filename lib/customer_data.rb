require_relative 'customer_data/storage'

module CustomerData
  module Config
    TERM_KEY = ENV['REDIS_TERM_KEY'] || 'lita:handlers:karma:terms'
  end

  def self.available_karma(term)
    REDIS.zscore(Config::TERM_KEY, term)
  end
end
