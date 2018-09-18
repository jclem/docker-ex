FROM elixir:1.7-alpine

ARG ALPINE_VERSION=3.8

RUN mix local.rebar --force
RUN mix local.hex --force

ENTRYPOINT ["mix"]
