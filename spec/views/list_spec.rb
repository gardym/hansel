require 'spec_helper'
require 'haml'

class ListScope
  include Hansel::LinkifyHelper
  attr_accessor :gists
  def initialize(gists)
    @gists = gists
  end
end

describe 'lists of gists' do
  let(:test_gists) { [] }
  let(:scope) { ListScope.new(test_gists) }
  let(:template) { File.read(File.join(settings.views, 'list.haml')) }
  let(:list_output) { Haml::Engine.new(template).render(scope) }

  describe 'tagging metadata' do
    describe 'the data attribute for a gist' do
      let(:test_gists) { [ FactoryGirl.create(:gist, :tags => ['music', 'buythis']) ] }
      it 'contains the tags of the gist' do
        list_output.should include("data-tags='buythis music'")
      end
    end
    describe 'when the gist has no tags' do
      let(:test_gists) { [ FactoryGirl.create(:gist) ] }
      describe 'the data attribute' do
        it 'does not exist do' do
          list_output.should_not include("data-tags")
        end
      end
    end
  end
end
