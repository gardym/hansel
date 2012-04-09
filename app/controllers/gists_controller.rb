
get '/gists' do
	@gists = Gist.where(:done => false)
	haml :list, :format => :html5
end

put '/gist/:id' do
	puts params
	gist = Gist.find(params[:id])
	gist.update_attributes(params[:gist])
end