# syntax = docker/dockerfile:1

# This Dockerfile is designed for production, not development. Use with Kamal or build'n'run by hand:
# docker build -t my-app .
# docker run -d -p 80:80 -p 443:443 --name my-app -e RAILS_MASTER_KEY=<value from config/master.key> my-app

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version
ARG RUBY_VERSION=3.4.7
FROM docker.io/library/ruby:$RUBY_VERSION-slim AS base

WORKDIR /app

RUN apt-get update -qq && \
  apt-get install --no-install-recommends -y build-essential curl git libjemalloc2 libyaml-dev pkg-config && \
  rm -rf /var/lib/apt/lists /var/cache/apt/archives

COPY . .

RUN bundle install

EXPOSE 8000

CMD ["rake", "build"]
