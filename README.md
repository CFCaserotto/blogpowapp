# README
The app was created using -j esbuild --css bootstrap --database=postgresql 

The seed will create and admin user, some regulars users, blogs and comments.

Version
ruby "3.0.6"
gem "rails", "~> 7.1.3", ">= 7.1.3.2"

Gems:
gem 'devise'
gem 'rails-controller-testing'

Steps to clone the app
$ git clone git@github.com:CFCaserotto/blogpowapp.git ( git clone https://github.com/CFCaserotto/blogpowapp.git)
$ cd blogpowapp/
$ bundle install
$ sudo service postgresql start
$ rails db:create
$ rails db:migrate
$ rails db:seed
$ yarn install
$ rails railsassets:precompile (o run ./bin/dev)
$ rails s
