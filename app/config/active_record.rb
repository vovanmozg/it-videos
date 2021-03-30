# Set up a database that resides in RAM
case ENV['APP_ENV']
  when 'development'
  ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: 'app/db/development.sqlite3'
  )
  when 'test'
  ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: ':memory:'
    #database: 'app/db/test.sqlite3'
  )
end

ActiveRecord::Base.logger = Logger.new(STDOUT)
