FROM elixir:1.7-alpine

ARG ALPINE_VERSION=3.8

ARG WORKDIR
WORKDIR $WORKDIR

RUN mix local.rebar --force
RUN mix local.hex --force

ARG MIX_ENV=prod
RUN mix deps.get
RUN mix deps.compile
RUN mix compile

ARG COOKIE
RUN mix release

ARG MIX_APP_NAME
RUN cp _build/prod/rel/${MIX_APP_NAME}/releases/*/${MIX_APP_NAME}.tar.gz .
