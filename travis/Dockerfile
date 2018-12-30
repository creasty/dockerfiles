FROM ruby:2.5-alpine

ENV TRAVIS_VERSION 1.8.9

RUN set -x \
  && apk add --no-cache -U --virtual .build-deps build-base \
  && apk add git \
  && gem install travis -v $TRAVIS_VERSION --no-document \
  && apk del .build-deps

ENTRYPOINT ["travis"]
