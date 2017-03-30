require "bundler/setup"
require "dreaming_god"
require 'standalone_migrations'
require 'database_cleaner'
require 'active_record'
require 'db/db_person'
require 'db/db_place'
require 'db/db_thing'
require 'db/db_session'

ActiveRecord::Base.establish_connection(
  :adapter  => 'sqlite3',
  :database => 'db/development.sqlite3')
  
RSpec.configure do |config|
  
  config.before(:suite) do
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.clean_with(:truncation)
    end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
  
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end





