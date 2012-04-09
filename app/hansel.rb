require 'sinatra'
require 'mongoid'

require File.join(File.dirname(__FILE__), 'mongoid_config')

require File.join(File.dirname(__FILE__), 'models', 'gist')
require File.join(File.dirname(__FILE__), 'controllers', 'mails_controller')
require File.join(File.dirname(__FILE__), 'controllers', 'gists_controller')
