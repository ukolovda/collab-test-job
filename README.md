# README

Collab test job from Ukolov Dmitry (https://github.com/ukolovda)


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

Tested with 2.6.5

* System dependencies

Linux or ather Ruby-compacible

* Configuration

None

* Database creation

Use standard PostgreSQL database 9.5 or more

* Database initialization

You should upload dictionary from HTTP:

`heroku run bin/rake upload_words` 

* How to run the test suite

`rails test`

* Services (job queues, cache servers, search engines, etc.)

None

* Deployment instructions

```
$ git push heroku master
$ heroku run bin/rails db:migrate
$ heroku run bin/rake upload_words
 