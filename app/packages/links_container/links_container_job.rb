module LinksContainer
  class LinksContainerJob
    @queue = :simple

    def self.async
      self
    end

    def self.perform
      LinksContainer::Services::Start.new.call
    end

    def self.process(url)

      # p LinksContainer::LinksContainerModel.count
      # res = LinksContainer::LinksContainerModel.find_or_create_by(url: url)
      #
      # unless res.start!
      #   puts 'updatable source should be in a waiting state'.red
      # end
      # p 1, "res: #{res}"
      # p 2, res.running?
      # p 3, "start", res.start!
      # p 4, res.running?
      #
      #

    end
  end
end
