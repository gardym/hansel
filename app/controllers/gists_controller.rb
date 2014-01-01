get '/gists' do
  list { Gist.where(:done => false) }
end

get '/gists/all' do
  list { Gist.all }
end

put '/gist/:id' do
  gist = Gist.find(params[:id])
  gist.update_attributes(params[:gist])
end

def list
  throw(:warden) unless env['warden'].authenticated?

  @gists = apply_order(yield)
  @tags = load_unique_tags

  haml :list, :format => :html5
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

def load_unique_tags
  @gists.select { |g| not g.tags.nil? }.map { |g| g.tags }.flatten.sort.uniq
end
