hansel!: the key-value pair store for your life.
================================================

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
2. bin/rake "db:baseline[<email@local.com>, <password>]"
3. shotgun
4. visit: http://localhost:9393/gists


Notes
-----
Colors: http://kuler.adobe.com/#themeID/1833017

Todo
----
- Labelling ([Label] [Tags] in email subject)
