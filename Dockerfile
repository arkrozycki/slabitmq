# Builder Image
# -------------
FROM golang:1.15-alpine as builder
# System setup
RUN apk update && apk add git curl build-base autoconf automake libtool


#   BASE IMAGE
# -------------
FROM golang:1.15-alpine as base
RUN apk update && apk add --no-cache git ca-certificates


#  DEV IMAGE
# -------------
FROM base as dev
# COPY --from=builder /export /usr
# Add in air file monitor
RUN go get -u github.com/cosmtrek/air
WORKDIR /go/src/github.com/arkrozycki/slabitmq
# Setup live reload
CMD air -c air.conf