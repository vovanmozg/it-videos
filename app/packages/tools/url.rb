module Tools
  class Url
    def self.get(url, cache = false)
      if cache
        with_cache(url) do
          download(url)
        end
      else
        download(url)
      end
    end

    def self.with_cache(url)
      cache_key = "url:#{url}"
      content = CACHE.read(cache_key)
      return content if content

      puts 'download without cache'.red
      content = yield
      CACHE.write(cache_key, content)
      content
    end

    def self.download(url)
      uri = URI(url)
      x = Net::HTTP.get(uri)
      x
    end
  end
end
