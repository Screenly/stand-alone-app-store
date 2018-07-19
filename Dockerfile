#FROM ruby:2.4.1-stretch
FROM jekyll/jekyll
ENV LANG C.UTF-8
RUN mkdir /usr/src/app
WORKDIR /usr/src/app

ADD Gemfile /usr/src/app
ADD Gemfile.lock /usr/src/app

RUN gem install bundle && \
    bundle && \
    bundle install
