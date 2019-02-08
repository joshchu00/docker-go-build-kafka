FROM golang:1.11.5-alpine
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community"  >> /etc/apk/repositories
RUN apk update
RUN apk --no-cache add git gcc libc-dev tzdata
RUN apk --no-cache --allow-untrusted -X https://apkproxy.herokuapp.com/sgerrand/alpine-pkg-glibc add glibc glibc-bin
RUN apk --no-cache add librdkafka librdkafka-dev --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

RUN mkdir -p /.cache/go-build
RUN chmod -R 777 /.cache
