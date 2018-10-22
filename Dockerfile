FROM ruby:2.5.3

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -qq -y --no-install-recommends build-essential nodejs yarn

WORKDIR /usr/src/app

COPY Gemfile* /usr/src/app/

RUN bundle install

COPY package.json yarn.lock /usr/src/app/

RUN yarn

COPY . /usr/src/app/
