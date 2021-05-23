FROM ruby:3.0.1-alpine

ENV RIDGEPOLE_VERSION 0.9.4
ENV PG_VERSION 1.2.3

RUN apk add --no-cache --update \
    ca-certificates \
    postgresql-dev \
  && apk add --no-cache --update --virtual .build-deps \
    build-base \
  && gem install ridgepole --no-document --version $RIDGEPOLE_VERSION \
  && gem install pg --no-document --version $PG_VERSION \
  && apk del .build-deps

ENTRYPOINT ["ridgepole"]
