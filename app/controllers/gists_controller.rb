before '/gist*' do
  login_required
end

get '/gists' do
  @gists = apply_order(Gist.where(:done => false))
  @tags = @gists.select { |g| not g.tags.nil? }.map { |g| g.tags }.flatten.sort.uniq
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
