require 'bundler'
Bundler.require

# require_relative '../lib/Appointment'
# require_relative '../lib/Barber'
# require_relative '../lib/Shop'
# require_relative '../lib/Client'


ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
ActiveRecord::Base.logger = nil