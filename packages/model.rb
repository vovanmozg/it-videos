class Model
  include Mongoid::Document

  def self.inherited(child_class)

    store_in collection: 'kuku'
    puts "#{child_class} inherits #{self}"
  end

  # def store_in(options)
  #   super
  #   Validators::Storage.validate(self, options)
  #   storage_options.merge!(options)
  # end
end