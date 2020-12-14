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

Add `pg` gem in Gemfile

```sh
docker-compose build

docker-compose up

docker-compose run web bin/rails db:create

docker-compose run web bin/rails db:migrate

docker-compose up -d

docker-compose down
```

Visit http://localhost:3000

run is fine for local development

Use exec for working on remote servers

Follow up on this to check if there is a supervisor

```sh
docker-compose exec web bin/rails generate model Article

docker-compose exec web bin/rails db:migrate

docker-compose exec web bin/rails console
```

irb session:

```ruby
Time.now
Article.all
Article.new

a = Article.new
a.title = "Sample Article Title"
a.body = "This is the text for my article, woo hoo!"
a.save
Article.all
```

```sh
docker-compose exec web bin/rails routes

docker-compose exec web bin/rails generate controller articles

docker-compose exec web bin/rails assets:precompile

docker-compose exec web bin/rails generate model Comment author_name:string body:text article:references

docker-compose exec web bin/rails db:migrate

docker-compose exec web bin/rails console
```

irb session:

```ruby
reload!

a = Article.first
a.comments
Comment.new
a.comments.new
a.comments

c = a.comments.new
c.author_name = "Daffy Duck"
c.body = "I think this article is thhh-thhh-thupid!"
c.save
d = a.comments.create(author_name: "Chewbacca", body: "RAWR!")

a.comments
a.reload
a.comments
```

```sh
docker-compose exec web bin/rails generate controller comments
```