require './lib/DatabaseConnection.rb'

ENV['RACK_ENV'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
  