# Odin Rails Blog

## Implementation Notes

Requires: brew, ruby-install, chruby, docker, rails to build
Requires: docker to run
Requires: heroku to deploy

```sh
ruby-install ruby 2.6.6
chruby 2.6.6
rails new odin-rails-blog
```

Add Dockerfile, docker-compose.yml, init.sql

Update ruby version in Gemfile

Add pg gem in Gemfile

```sh
docker-compose build

docker-compose up

docker-compose up -d

docker-compose run web rails db:create

docker-compose run web rails db:migrate

docker-compose down
```

Visit http://localhost:3000

run is fine for local development
Use exec for working on remote servers

```sh
docker-compose run web rails generate model Article
```