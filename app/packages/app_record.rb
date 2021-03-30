class AppRecord < ActiveRecord::Base
  self.abstract_class = true

  # Sets table name
  module StoreIn
    def self.included(base)

      collection_name = base.name.tableize.match(%r{([^\/].*?)_model})[1].pluralize
      base.table_name = collection_name
    end
  end

  #
  # def self.inherited(child_class)
  #
  #   collection_name = child_class.name.tableize.match(/([^\/].*?)_model/)[0].pluralize
  #   p self.table_name = collection_name
  #
  #   # p '-----------------'
  #   # puts "#{child_class} inherits #{self}"
  #   # store_in collection: 'kuku'
  #
  # end

  # def store_in(options)
  #   super
  #   Validators::Storage.validate(self, options)
  #   storage_options.merge!(options)
  # end
end