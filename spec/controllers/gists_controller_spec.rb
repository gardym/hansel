require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe "Gists Controller" do
	include Rack::Test::Methods

	def app
		@app ||= Sinatra::Application
	end

	describe 'get /gists' do

		it 'should load all of the gists that are not done' do

			5.times { FactoryGirl.create(:gist) }
			2.times { FactoryGirl.create(:done_gist) }
			4.times { FactoryGirl.create(:text_gist) }

			Gist.should_receive(:where)
				.with(hash_including(:done => false))

			get '/gists'

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
