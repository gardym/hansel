require File.join(File.dirname(__FILE__), '..', 'app', 'hansel')
require 'rack/test'

require File.join(File.dirname(__FILE__), 'factories', 'gist_factory')

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Tidy up Mongodb before each test run and after the whole suite has run.
  clean_up_mongo = Proc.new { Mongoid.master.collections.select { |c| c.name !~ /system/ }.each(&:drop) }
  #config.before(:each) { clean_up_mongo.call }
	#config.after(:all) { clean_up_mongo.call }
end
