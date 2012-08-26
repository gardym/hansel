require 'sinatra'
require 'mongoid'

Mongoid.load!(File.join(settings.root, 'mongoid.yml'))
Dir.glob(File.join(File.dirname(__FILE__), "{controllers,models,helpers}", "*.rb")) { |f| require f }
use Rack::Session::Cookie, :secret => 'Or did you think I was too stupid to know what a eugoogooly was?'
