hansel: the key-value pair store for your life.
===============================================

Works with E-Mail! Mobile-friendly!

Develop
-------
1. Clone this repository
2. bundle install --binstubs
3. Start mongod locally
4. bin/rake spec (for the hell of it)

Run
---
0. (as above)
1. bin/rake db:rebuild
2. bin/rake "db:baseline\[email@local.com, password\]"
3. shotgun
4. visit: http://localhost:9393/gists

Deploy
------
- Deploy to Heroku
- Add the MongoHQ add-on.
- Add the CloudMailin add-on.
- Forward your CloudMailin POST to /mails on your Heroku instance.
- Take the output of heroku config -s | grep MONGOHQ_URL
  and put it before bin/rake "db:baseline[yourlogin@email.com, password]"



Notes
-----
Colors: http://kuler.adobe.com/#themeID/1833017

Todo
----
- Labelling ([Label] [Tags] in email subject)
