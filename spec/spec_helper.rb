require 'active_type'
require 'active_record'
require 'yaml'

connection_hash = YAML::load(File.open(File.join(File.dirname(__FILE__), 'connection.yml')))
ActiveRecord::Base.establish_connection(connection_hash)
