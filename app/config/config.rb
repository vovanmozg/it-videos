require_relative './autoload'

Dir['./app/config/*.rb']
  .reject { |f| f =~ %r{./app/config/(config|constants|autoload).rb} }
  .each { |file| require file }
