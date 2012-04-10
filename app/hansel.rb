require 'sinatra'
require 'mongoid'
require 'sinatra-authentication'

require File.join(File.dirname(__FILE__), 'mongoid_config')

require File.join(File.dirname(__FILE__), 'models', 'gist')
require File.join(File.dirname(__FILE__), 'controllers', 'mails_controller')
require File.join(File.dirname(__FILE__), 'controllers', 'gists_controller')
require File.join(File.dirname(__FILE__), 'controllers', 'auth_controller')

use Rack::Session::Cookie, :secret => 'Or did you think I was too stupid to know what a eugoogooly was?'
