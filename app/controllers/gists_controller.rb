
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
	if params[:order_by]
		o = /(?<field>.*),(?<order>.*)/.match(params[:order_by])
		@gists = @gists.order_by([o[:field].strip, o[:order].strip])
	end
	@order_by = params[:order_by]
end