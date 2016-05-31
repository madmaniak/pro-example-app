## Pro example app

[Pro](http://madmaniak.github.io/pro)

### Start

```
git clone git@github.com:madmaniak/pro-example-app.git
cd pro-example-app
```

#### Manual environment setup

Checkout [servers](https://github.com/madmaniak/pro-example-app/tree/master/servers) subdirectories
and read there about dependencies. It takes about 30 minutes to install all of them.

#### Auto setup using Vagrant

Install [Vagrant](https://www.vagrantup.com/downloads.html) (v1.8.1 or greater). If you've tried to install stuff manually make sure there is no ```node_modules``` directory in ```servers/webpack``` and ```servers/primus```.

```
vagrant up
vagrant ssh
cd /vagrant
```

#### After setup

Since there is no server in Pro dealing with migrations yet run one manually.

```
cd servers/ruby
ruby ../../app/questions/migration.rb
cd ../..
```

Then:

```
foreman start
```

Visit [http://localhost:3000](http://localhost:3000) and see simple app for asking questions.
