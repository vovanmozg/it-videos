module Mongoid
  # calls Mongoid method store_in in class context for class included
  module StoreIn
    def self.included(base)
      collection_name = base.name.tableize.match(/.*?\/(.*?)_model/)[1].pluralize
      base.store_in collection: collection_name
    end
  end
end
