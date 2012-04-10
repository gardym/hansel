require 'rake'
require 'rspec/core/rake_task'

desc "Run all specs"
task :spec => ["spec:controllers", "spec:models"]

namespace "spec" do

	RSpec::Core::RakeTask.new(:controllers) do |t|
		t.pattern = "./spec/controllers/*_spec.rb"
	end

	RSpec::Core::RakeTask.new(:models) do |t|
		t.pattern = "./spec/models/*_spec.rb"
	end

end

require File.join(File.dirname(__FILE__), 'app', 'hansel')
require File.join(File.dirname(__FILE__), 'spec', 'factories', 'gist_factory')

namespace "db" do

	desc "Seed the database"
	task :seed do
		6.times { FactoryGirl.create(:gist) }
		4.times { FactoryGirl.create(:text_gist) }
		3.times { FactoryGirl.create(:done_gist) }
	end

	desc "Remove all test data"
	task :drop do
		Mongoid.master.collections.select { |c| c.name !~ /system/ }.each(&:drop)
	end

end

task :default => [:spec]
