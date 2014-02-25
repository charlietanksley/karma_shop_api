module CustomerData
  class Storage
    attr_reader :key, :redis

    def initialize(redis = REDIS, key = Config::TERM_KEY)
      @redis = redis
      @key = key
    end

    def all_customers
      all_terms_with_karma
    end

    def available_karma(term)
      redis.zscore(key, term)
    end

    def charge_account(term: nil, amount: nil)
      charge = -amount
      redis.zincrby(key, charge, term)
    end

    private

    def all_terms_with_karma
      redis.zrange(key, 0, -1)
    end
  end
end
