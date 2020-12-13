FROM ruby:2.6.6-slim-stretch

RUN apt-get update && apt-get install -y \
  curl \
  build-essential \
  libpq-dev &&\
  curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y nodejs yarn

COPY . /app
WORKDIR /app

EXPOSE 3000

# COPY Gemfile .
# COPY Gemfile.lock .
RUN gem update bundler
RUN bundle install --jobs 5

# COPY package.json .
# COPY yarn.lock .
RUN yarn install

# FROM ruby:2.7.1

# RUN gem update --system
# RUN gem install bundler

# RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
# RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn
# COPY . /app
# WORKDIR /app
# # COPY Gemfile /app/Gemfile
# # COPY Gemfile.lock /app/Gemfile.lock
# RUN bundle install
# RUN yarn install --check-files

# COPY entrypoint.sh /usr/bin/
# RUN chmod +x /usr/bin/entrypoint.sh
# ENTRYPOINT ["entrypoint.sh"]
# EXPOSE 3000

# CMD ["rails", "server", "-b", "0.0.0.0"]