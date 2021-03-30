require_relative '../../app/db/schema'

namespace :db do
  desc 'Define database scheme'
  task :create do
    define_schema
  end
end
