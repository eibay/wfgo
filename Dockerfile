FROM public.ecr.aws/lambda/provided:al2 as build
# install compiler
RUN yum install -y golang
RUN go env -w GOPROXY=direct
ADD . .
# RUN CGO_ENABLED=0 GOOS=linux go build -o app /main
RUN CGO_ENABLED=0 GOOS=linux go build -o /main
# copy artifacts to a clean image
FROM public.ecr.aws/lambda/provided:al2
COPY --from=build /main /main
ENTRYPOINT [ "/main" ]     