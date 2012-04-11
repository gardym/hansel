require File.join(File.dirname(__FILE__), 'hansel')

raise "Can't insert baseline data without GIST_PASSWORD set" if !ENV['GIST_PASSWORD']

user = MongoidUser.create(:email => 'conversationing@gmail.com')
user.password = ENV['GIST_PASSWORD']
user.save
