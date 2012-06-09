require 'mail'

post '/mails' do
  plain_text = (params[:plain] && params[:plain].strip)

  begin
    link = plain_text if URI.parse(plain_text)
  rescue URI::InvalidURIError
    link = nil
  end

  message = Mail.new(params[:message])
  Gist.create(:title => message.subject, :link => link,
              :text => plain_text, :created_at => message.date,
              :done => false)
end
