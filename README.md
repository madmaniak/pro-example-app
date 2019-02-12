## Pro example app

[Pro](http://madmaniak.github.io/pro)

### Start

```sh
git clone git@github.com:madmaniak/pro-example-app.git
cd pro-example-app

git submodule update --init --recursive
./pro update
```

#### Setup and run

[Docker Compose](https://docs.docker.com/compose/install) (version >= 1.9.0 recommended) is required.

```sh
./pro start
```

Visit [http://localhost:3000](http://localhost:3000)
and
[http://localhost:8000](http://localhost:8000) for database view.
