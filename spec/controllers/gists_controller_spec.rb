require 'spec_helper'

# Assume authenticated
module Sinatra
  module Helpers
    def login_required
    end
  end
end

describe "Gists Controller" do
  include Rack::Test::Methods

  def app
    @app ||= Sinatra::Application
  end

  context 'with gists' do

    before(:all) do
      5.times { FactoryGirl.create(:gist) }
      2.times { FactoryGirl.create(:done_gist) }
      4.times { FactoryGirl.create(:text_gist) }
    end

    describe 'get /gists' do

      it 'should load all of the gists that are not done' do

        Gist.should_receive(:where)
          .with(hash_including(:done => false))

        get '/gists'

      end

      describe 'without an order by parameter' do

        it 'should order by the default which is created_at, ascending' do

          gist = double("gist")
          Gist.stub(:where).and_return(gist)
          gist.should_receive(:order_by)
            .with(["created_at", "asc"])

          get '/gists'

        end

      end

      describe 'with an order by parameter' do

        it 'should order the gists by the given parameter' do

          gist = double("gist")
          Gist.stub(:where).and_return(gist)
          gist.should_receive(:order_by)
            .with(["created_at", "desc"])

          get '/gists', {:order_by => "created_at, desc"}

        end

      end

      describe 'with a text gist' do

        it 'should linkify the text' do

          gist = mock(:gist, :id => 1, :text => "This is some sample text for: http://www.google.com.au",
                      :done => false, :title => "", :link => "")
          gist.stub(:order_by).and_return([gist])
          Gist.stub(:where).and_return(gist)

          get '/gists'

          last_response.body.should include("<a target=\"_blank\" href=\"http://www.google.com.au\">http://www.google.com.au</a>")

        end

      end

      describe 'with a gist with tags' do
        it 'should list the tags for the gist' do

          gist = mock(:gist, :id => 1, :text => "This is some sample text for: http://www.google.com.au",
                      :done => false, :title => "", :link => "", :tags => ["tag1", "tag2"])
          gist.stub(:order_by).and_return([gist])
          Gist.stub(:where).and_return(gist)

          get '/gists'

          last_response.body.should include("tag1")
          last_response.body.should include("tag2")
        end
      end

    end

    describe 'get /gists/all' do

      it 'should load all of the gists' do

        Gist.should_receive(:all)

        get '/gists/all'

      end

      describe 'with an order by parameter' do

        it 'should order the gists by the given parameter' do

          gist = double("gist")
          Gist.stub(:all).and_return(gist)
          gist.should_receive(:order_by)
            .with(["created_at", "desc"])

          get '/gists/all', {:order_by => "created_at, desc"}

        end

      end

    end

  end

  describe 'put /gist/:id' do

    it 'should update the gist with the given values' do

      gist = FactoryGirl.create(:gist)
      gist.done.should be false

      params = {:gist => {:done => true}}

      put '/gist/' + gist.id.to_s, params

      found_gist = Gist.find(gist.id)
      found_gist.done.should be true

    end

  end

end
