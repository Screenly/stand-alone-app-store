FROM ruby:2.4.1-stretch
ENV LANG C.UTF-8
RUN mkdir /usr/src/app
WORKDIR /usr/src/app

# hadolint ignore=DL3008
RUN apt-get update -qq && \
    apt-get install -y build-essential imagemagick optipng

# hadolint ignore=DL4006
RUN curl -sL https://deb.nodesource.com/setup_14.x  | bash -

# hadolint ignore=DL3008
RUN apt-get install -y nodejs

COPY Gemfile /usr/src/app
# COPY Gemfile.lock /usr/src/app

RUN gem install bundle && \
    bundle && \
    bundle install
