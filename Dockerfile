FROM golang:alpine AS build

RUN apk add --no-cache curl git alpine-sdk

WORKDIR $GOPATH/src/github.com/eibay/wfgo

COPY . $GOPATH/src/github.com/eibay/wfgo/
RUN go build -ldflags="-s -w" -a -o /main

FROM alpine:latest
WORKDIR /main
COPY --from=build /main /main
EXPOSE 8080
ENTRYPOINT [ "./main" ]      