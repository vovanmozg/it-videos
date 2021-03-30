# Connect gems from Gemfile
require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

# Connect using gems besides Gemfile
require 'open-uri'
require 'active_record'

# Connect project files
#require './app/autoload'
require './app/config/constants'
require './app/config/config'
#require './app/config/active_record'
