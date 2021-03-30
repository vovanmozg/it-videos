module Cache
  class Cache
    def initialize(provider)
      @provider = provider
    end

    def get(key)
      @provider.get(key)
    end

    def set(key, val)
      @provider.set(key, val)
    end
  end
end
