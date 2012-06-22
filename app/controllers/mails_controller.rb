require 'mail'

post '/mails' do
  plain_text = (params[:plain] && params[:plain].strip)

  begin
    link = plain_text if URI.parse(plain_text)
  rescue URI::InvalidURIError
    link = nil
  end

  message = Mail.new(params[:message])

  tags_regex = /\[([\s\w]*)\]/
  tags = message.subject.scan(tags_regex).flatten unless message.subject.nil?
  title = message.subject.gsub(tags_regex, "").strip unless message.subject.nil?

  Gist.create(:title => title, :link => link,
              :text => plain_text, :created_at => message.date,
              :tags => tags,
              :done => false)
end
