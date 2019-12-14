FROM elixir:1.9.4-alpine

MAINTAINER Vito Botta <vito@botta.me>

RUN \
    mkdir -p /opt/app && \
    chmod -R 777 /opt/app && \
    apk update && \
    apk --no-cache --update add \
      build-base \
      g++ \
      wget \
      curl \
      inotify-tools \
      nodejs \
      nodejs-npm && \
    npm install npm -g --no-progress && \
    update-ca-certificates --fresh && \
    rm -rf /var/cache/apk/*

ENV PATH=./node_modules/.bin:$PATH

RUN mix do local.hex --force, local.rebar --force

RUN mix archive.install hex phx_new 1.4.11 --force

WORKDIR /opt/app

CMD ["/bin/sh"]