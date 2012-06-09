require 'mail'

post '/mails' do
  message = Mail.new(params[:message])
  plain = params[:plain]
  plain && plain.strip!

  text = plain
  begin
    uri_parsed = URI.parse(plain)
    link = plain
  rescue
    # Don't do it
  end

  Gist.create(:title => message.subject, :link => link,
              :text => text, :created_at => message.date,
              :done => false)

end
