require 'mongoid'

Mongoid.configure do |config|
	if ENV['MONGOHQ_URL']
		connection = Mongo::Connection.from_uri(ENV['MONGOHQ_URL'])
		uri = URI.parse(ENV['MONGOHQ_URL'])
		config.master = connection.db(uri.path.gsub(/^\//, ''))
	else
		config.master = Mongo::Connection.from_uri("mongodb://localhost:27017").db("development")
	end
end