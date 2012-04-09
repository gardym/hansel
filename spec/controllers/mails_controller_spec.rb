require File.join(File.dirname(__FILE__), '..', 'spec_helper')
require 'mail'

def stub_email(subject, body)
	email = Mail.new
	email.subject subject
	email.body body

	email
end

describe "Mails Controller" do
	include Rack::Test::Methods

	def app
		@app ||= Sinatra::Application
	end

	describe 'post /mails' do

		describe 'with a title/link email' do

			before(:each) do
				@title 	= "A really really ridiculously good looking link."
				@link 	= "http://www.rrrgoodlooking.com"
			end

			it 'should create a new gist with the title and link set' do

				email = stub_email(@title, @link)

				Gist.should_receive(:create)
					.with(hash_including(:title => @title))
					.with(hash_including(:link => @link))

				post '/mails', { :message => email.to_s }

			end

		end

		describe 'with a title/text email' do

			before(:each) do
				@title 	= "What say we settle this on the runway... Han Solo"
				@text		= "Are you challenging me to a walk off? Boo-lander"
			end

			it 'should create a new gist with the title and text set' do

				email = stub_email(@title, @text)

				Gist.should_receive(:create)
					.with(hash_including(:title => @title))
					.with(hash_including(:text => @text))

				post '/mails', { :message => email.to_s }

			end

		end

		describe 'date stamping' do

			it 'should create a new gist with the date from the email' do

				date = Time.now

				email = Mail.new
				email.date = date

				Gist.should_receive(:create)
					.with(hash_including(:created_at => email.date))

				post '/mails', { :message => email.to_s }

			end

		end

		describe 'done flag' do

			it 'should create a new gist that is not done' do

				email = Mail.new

				Gist.should_receive(:create)
					.with(hash_including(:done => false))

				post '/mails', { :message => email.to_s }

			end

		end

	end

end