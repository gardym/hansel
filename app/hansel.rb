require 'sinatra'
require 'mongoid'
require 'digest/sha1'
require 'warden'

Mongoid.load!(File.join(settings.root, 'mongoid.yml'))
Dir.glob(File.join(File.dirname(__FILE__), "{controllers,models,helpers}", "*.rb")) { |f| require f }
use Rack::Session::Cookie, :secret => 'Or did you think I was too stupid to know what a eugoogooly was?'

class FailApp < Sinatra::Base
  get '/unauthenticated' do
    haml :none_shall_passcode
  end
end

use Warden::Manager do |manager|
  manager.default_strategies :passcode
  manager.failure_app = FailApp
end

Warden::Manager.serialize_into_session do |passcode|
  passcode.sha
end

Warden::Manager.serialize_from_session do |sha|
  Passcode.where(:sha => sha)
end

Warden::Strategies.add(:passcode) do
  def valid?
    params['passcode']
  end

  def authenticate!
    p = Passcode.where(:sha => Digest::SHA1.hexdigest(params['passcode'])).first
    p.nil? ? fail!('Passcode is not valid.') : success!(p)
  end
end

