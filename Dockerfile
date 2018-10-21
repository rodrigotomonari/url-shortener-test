FROM ruby:2.5.3

RUN apt-get update && apt-get install -qq -y --no-install-recommends build-essential nodejs

WORKDIR /usr/src/app

COPY Gemfile* /usr/src/app/

RUN bundle install

COPY . /usr/src/app/
