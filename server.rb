#!/usr/bin/ruby
require 'rack'

puts 'cody server start'

server = Rack::Builder.new do
  run Rack::Directory.new(Dir.pwd)
end
 
Rack::Handler::WEBrick.run(server)