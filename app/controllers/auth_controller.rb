# Disable sinatra-authentication defaults for signing up and viewing users

after '/signup' do
  response.redirect("/")
end

after '/user*' do
  response.redirect("/")
end
