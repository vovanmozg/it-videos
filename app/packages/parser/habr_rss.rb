module Parser
  # Parser for habr RSS
  class HabrRss
    include Log::Loggable

    def self.match?(url)
      # If url begins with specified pattern
      (url =~ %r{https?://habr.com/ru/rss/all/all}) == 0
    end

    def urls(content)
      log_debug('Parser::HabrRss#get_urls')
      doc = Nokogiri::HTML(content)
      doc.css('item guid').map(&:content)
    end
  end
end
