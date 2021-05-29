FROM golang:buster as build
# install compiler
RUN go env -w GOPROXY=direct
ADD . .
# RUN CGO_ENABLED=0 GOOS=linux go build -o app /main
RUN CGO_ENABLED=0 GOOS=linux go build -o /main
# copy artifacts to a clean image
FROM alpine:latest
COPY --from=build /main /main
ENTRYPOINT [ "/main" ]      