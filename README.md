## Pro example app

[Pro](http://madmaniak.github.io/pro)

### Start

```sh
git clone git@github.com:madmaniak/pro-example-app.git
cd pro-example-app
```

#### Setup and run

[Docker Compose](https://docs.docker.com/compose/install) (version >= 1.9.0 recommended) is required.

```sh
docker-compose up --build

# it will download images and try to run pro but you will be notified
# about missing configs - copy them from the examples

docker-compose up
```

Visit [http://localhost:3000](http://localhost:3000)
and
[http://localhost:8000](http://localhost:8000) for database view.
