require File.join(File.dirname(__FILE__), 'hansel')

module Baseline
  def self.setup(email, password)
    raise "Can't insert baseline data without email and password." if (email.nil? || password.nil?)

    user = MongoidUser.create(:email => email)
    user.password = password
    user.save
  end
end
