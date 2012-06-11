require 'mongoid'

class Gist
  include Mongoid::Document

  field :title, type: String
  field :link, type: String
  field :text, type: String
  field :done, type: Boolean
  field :tags, type: Array
  field :created_at, type: DateTime
end
