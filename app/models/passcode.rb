require 'mongoid'

class Passcode
  include Mongoid::Document

  field :sha, type: String
end
