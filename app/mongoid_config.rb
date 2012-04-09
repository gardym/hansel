require 'mongoid'

Mongoid.configure do |config|
	config.master = Mongo::Connection.from_uri("mongodb://localhost:27017").db("test")
end