require 'digest/sha1'
require File.join(File.dirname(__FILE__), 'hansel')

module Baseline
  def self.setup(passcode)
    raise "Can't insert baseline data without a passcode." if (passcode.nil?)
    Passcode.create(:sha => Digest::SHA1.hexdigest(passcode))
  end
end
