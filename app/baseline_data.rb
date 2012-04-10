require File.join(File.dirname(__FILE__), 'hansel')

user = MongoidUser.create(:email => 'conversationing@gmail.com')
user.password = 'password1'
user.save
