# Odin Rails Blog

## Implementation Notes

```sh
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