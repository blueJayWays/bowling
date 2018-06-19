FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /k-test
WORKDIR /k-test
COPY Gemfile /k-test/Gemfile
COPY Gemfile.lock /k-test/Gemfile.lock
RUN bundle install
COPY . /k-test
