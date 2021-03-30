def define_schema
  # TODO: move to rake db:create task
  # Set up database tables and columns
  ActiveRecord::Schema.define do
    create_table :tests, force: true do |t|
      t.string :name
    end

    create_table :links_containers, force: true do |t|
      t.string :url
      t.string :content
      t.string :aasm_state
      t.boolean :repeating
      t.datetime :updated_at
    end

    create_table :medias, force: true do |t|
      t.string :url
      t.string :content
      t.string :aasm_state
      t.text :meta
    end
  end
end
