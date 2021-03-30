require_relative '../../app/db/seed'

namespace :db do
  desc 'Create default data'
  task :seed do
    seed_db
  end
end
