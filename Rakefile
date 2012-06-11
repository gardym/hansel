require 'rake'
require File.join(File.dirname(__FILE__), 'app', 'hansel')
require File.join(File.dirname(__FILE__), 'app', 'baseline_data')

def on_local?
  !ENV['RACK_ENV'] || ["test", "development"].include?(ENV['RACK_ENV'])
end

if on_local?

  require 'rspec/core/rake_task'

  desc "Run all specs"
  task :spec => ["spec:controllers", "spec:models", "spec:helpers"]
  task :test => [:spec]
  task :default => [:spec]

  namespace "spec" do
    RSpec::Core::RakeTask.new(:controllers) do |t|
      t.pattern = "./spec/controllers/*_spec.rb"
    end
    RSpec::Core::RakeTask.new(:models) do |t|
      t.pattern = "./spec/models/*_spec.rb"
    end
    RSpec::Core::RakeTask.new(:helpers) do |t|
      t.pattern = "./spec/helpers/*_spec.rb"
    end
  end

  require File.join(File.dirname(__FILE__), 'spec', 'factories', 'gist_factory')

  namespace "db" do
    desc "Seed the database"
    task :seed do
      60.times { FactoryGirl.create(:gist) }
      21.times { FactoryGirl.create(:mixed_gist) }
      43.times { FactoryGirl.create(:text_gist) }
      32.times { FactoryGirl.create(:done_gist) }
      12.times { FactoryGirl.create(:tagged_gist) }
    end

    desc "Remove all test data"
    task :drop do
      Mongoid.master.collections.select { |c| c.name !~ /system/ }.each(&:drop)
    end

    desc "Drop, reseed and insert baseline data"
    task :rebuild => ["db:drop", "db:seed"]
  end

end

namespace "db" do
  desc "Insert baseline data"
  task :baseline, [:email, :password] do |t, args|
    Baseline::setup(args.email, args.password)
  end
end
