module LinksContainer
  class ReadyToPerformQuery
    def initialize

    end

    def call
      #LinksContainerModel.waiting # .where('repeating = FALSE', Time.now - 1.day)
      #LinksContainerModel.waiting.where('repeating = FALSE', Time.now - 1.day)
      LinksContainerModel.where('updated_at < ? AND repeating = "t"', Time.now - 1.day)
      #LinksContainerModel.waiting.where('updated_at < ? AND repeating = TRUE OR repeating = FALSE', Time.now - 1.day)
    end
  end
end
