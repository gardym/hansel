require File.join(File.dirname(__FILE__), '..', 'spec_helper')

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
