source 'http://rubygems.org'

gem 'sinatra'

# This should be >= 0.4.2, but it isn't available as a gem yet.
# gem 'sinatra-authentication', '>=0.4.2'
gem 'sinatra-authentication',
  :git => 'git://github.com/maxjustus/sinatra-authentication.git',
  :ref => '57b60e3c57057ca57a6380d85a8b97eef8075b2f'

gem 'mail'
gem 'mongoid', '>=3'
gem 'bson_ext'
gem 'haml'
gem 'thin'
gem 'rake'

group :development, :test do
  gem 'heroku'
  gem 'foreman'
  gem 'shotgun'
  gem 'rspec'
  gem 'rack-test'
  gem 'factory_girl', '>=3.3'
  gem 'nokogiri'
end
