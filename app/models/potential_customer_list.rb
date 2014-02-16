require_relative 'store_config'

class PotentialCustomerList
  def self.alphabetical
    new
      .all
      .alphabetical
      .done
  end

  attr_reader :list, :redis
  def initialize(list: Array.new, redis: REDIS)
    @list = list
    @redis = redis
  end

  def all
    current_listing = redis.zrange(StoreConfig::TERM_KEY, 0, -1)
    self.class.new(list: current_listing, redis: redis)
  end

  def alphabetical
    self.class.new(list: list.sort, redis: redis)
  end

  def done
    list
  end
end
