require 'sinatra'
require 'mongoid'
require 'sinatra-authentication'

require File.join(File.dirname(__FILE__), 'mongoid_config')
Dir.glob(File.join(File.dirname(__FILE__), "{controllers,models}", "*.rb")) { |f| require f }

use Rack::Session::Cookie, :secret => 'Or did you think I was too stupid to know what a eugoogooly was?'
