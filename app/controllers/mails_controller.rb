require 'mail'

post '/mails' do
	message = Mail.new(params[:message])

	begin
		uri_parsed = URI.parse(message.body.decoded)

		link = message.body.decoded
		text = message.body.decoded
	rescue
		text = message.body.decoded
	end

	Gist.create(:title => message.subject, :link => link, 
							:text => text, :created_at => message.date,
							:done => false)

end
