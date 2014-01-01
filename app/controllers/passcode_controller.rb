get '/' do
  redirect '/gists'
end

get '/login' do
  redirect '/gists'
end

post '/login' do
  env['warden'].authenticate!
  redirect '/gists'
end
