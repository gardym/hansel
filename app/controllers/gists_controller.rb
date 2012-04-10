
before '/gist*' do
	login_required
end

get '/gists' do
	@gists = Gist.where(:done => false)
	apply_ordering
	haml :list, :format => :html5
end

get '/gists/all' do
	@gists = Gist.all
	apply_ordering
	haml :list, :format => :html5
end

put '/gist/:id' do
	gist = Gist.find(params[:id])
	gist.update_attributes(params[:gist])
end

def apply_ordering
	default_order = ["created_at", "asc"]
	if params[:order_by]
		o = /(?<field>.*),(?<order>.*)/.match(params[:order_by])
		@gists = @gists.order_by([o[:field].strip, o[:order].strip])
		@order_by = params[:order_by]
	else
		@gists = @gists.order_by(default_order)
		@order_by = default_order
	end
end