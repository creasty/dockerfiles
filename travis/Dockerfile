FROM ruby:2.4-alpine

ENV TRAVIS_VERSION 1.8.8

RUN set -x \
  && apk add --no-cache -U --virtual .build-deps build-base \
  && apk add git \
  && gem install travis -v $TRAVIS_VERSION --no-ri --no-rdoc \
  && apk del .build-deps

ENTRYPOINT ["travis"]
