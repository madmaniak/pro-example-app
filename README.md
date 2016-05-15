## Pro example app

[Pro](http://madmaniak.github.io/pro)

### Start

```
git clone git@github.com:madmaniak/pro-example-app.git
cd pro-example-app
```

Checkout the [servers](https://github.com/madmaniak/pro-example-app/tree/master/servers) subdirectories
and read about needed dependencies. Since there is no server in Pro dealing with migrations yet run one manually.

```
cd servers/ruby
ruby ../../app/questions/migration.rb
cd ../..
```

Then just:

```
foreman start
```

Visit [http://localhost:3000](http://localhost:3000) and see simple app for asking questions.
