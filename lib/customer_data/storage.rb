module CustomerData
  class Storage
    attr_reader :redis

    def initialize(redis = REDIS)
      @redis = redis
    end

    def all_customers
      all_terms_with_karma
    end

    private

    def all_terms_with_karma
      redis.zrange(Config::TERM_KEY, 0, -1)
    end
  end
end
