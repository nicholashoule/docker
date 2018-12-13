# Run Golang container for building Go services
#
# docker run --rm -it --name golang-dev 181gaming/golang
#
# https://golang.org/help/
# https://play.golang.org/
#
FROM golang:1.11.2
MAINTAINER Nicholas Houle <181gaming@gmail.com>

ENV NAME=golang-dev \
    DEBIAN_FRONTEND=noninteractive \
    PATH=$PATH:/go/bin:/usr/local/go/bin \
    GOPATH=/go

RUN APT_PACKAGES='bash apt-transport-https curl wget ca-certificates net-tools \
                  vim tmux locales git tar gzip unzip zip bzip2' && set -x && \
    apt-get update && apt-get install -y --no-install-recommends \
    $APT_PACKAGES && \
    apt-get autoremove -y && apt-get clean && \
    rm -fr /tmp/* /var/tmp/* /var/lib/apt/lists/*

# Set timezone to UTC by default
RUN ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime

# Use unicode
RUN locale-gen C.UTF-8 || true
ENV LANG=C.UTF-8

# Setting up golang example project
WORKDIR /go
RUN go get github.com/golang/example/hello

USER root
CMD ["/bin/bash"]
