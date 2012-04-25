
helpers do
	def linkify( text )
		generic_URL_regexp = Regexp.new( '(^|[\n ])([\w]+?://[\w]+[^ \"\n\r\t<]*)', Regexp::MULTILINE | Regexp::IGNORECASE )
		starts_with_www_regexp = Regexp.new( '(^|[\n ])((www)\.[^ \"\t\n\r<]*)', Regexp::MULTILINE | Regexp::IGNORECASE )

	  s = text.to_s
	  s.gsub!( generic_URL_regexp, '\1<a target="_blank" href="\2">\2</a>' )
	  s.gsub!( starts_with_www_regexp, '\1<a target="_blank" href="http://\2">\2</a>' )
	  s
	end
end

before '/gist*' do
	login_required
end

get '/gists' do
	@gists = apply_order(Gist.where(:done => false))
	haml :list, :format => :html5
end

get '/gists/all' do
	@gists = apply_order(Gist.all)
	haml :list, :format => :html5
end

put '/gist/:id' do
	gist = Gist.find(params[:id])
	gist.update_attributes(params[:gist])
end

def apply_order(gists)
	order = ["created_at", "asc"]

	if params[:order_by]
		o = /(?<field>.*),(?<order>.*)/.match(params[:order_by])
		order = [o[:field].strip, o[:order].strip]
	end

	@order_by = order.join(",")
	gists.order_by(order)
end