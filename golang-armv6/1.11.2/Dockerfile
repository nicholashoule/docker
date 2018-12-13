# Golang container for building armv6 Go services
#
# docker run --rm -it --name golang-dev 181gaming/golang-armv6:1.11.2
#
# Information:
# Running the container on Linux x86_64
#  Fedora: dnf install -y qemu qemu-user qemu-user-binfmt
#    - or -
#  Ubuntu: apt install -y qemu qemu-user-static qemu-user binfmt-support
#
#  - docker run --rm --privileged multiarch/qemu-user-static:register
#  - docker run --rm --privileged multiarch/qemu-user-static:register --reset
#  - docker run --rm -it --name golang-dev 181gaming/golang-armv6
#
# Golang:
# https://golang.org/help/
# https://play.golang.org/
#
FROM resin/rpi-raspbian
MAINTAINER Nicholas Houle <181gaming@gmail.com>

RUN [ "cross-build-start" ]

ENV NAME=golang-dev \
    DEBIAN_FRONTEND=noninteractive \
    PATH=$PATH:/go/bin:/usr/local/go/bin \
    GOVERSION=1.11.2 \
    GOPATH=/go

RUN APT_PACKAGES='bash apt-transport-https curl wget ca-certificates net-tools \
                  vim tmux locales git tar gzip unzip zip bzip2' \
    && set -x \
    && apt-get update && apt-get install -y --no-install-recommends $APT_PACKAGES \
    && apt-get autoremove -y && apt-get clean \
    && rm -fr /tmp/* /var/tmp/* /var/lib/apt/lists/*

# Get the proper version of go for armv6
RUN curl -sS -o "/tmp/go${GOVERSION}.linux-armv6l.tar.gz" "https://storage.googleapis.com/golang/go${GOVERSION}.linux-armv6l.tar.gz" \
    && tar -C /usr/local -xzf "/tmp/go${GOVERSION}.linux-armv6l.tar.gz"

# Set timezone to UTC by default
RUN ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime

# Use unicode
RUN locale-gen C.UTF-8 || true
ENV LANG=C.UTF-8

# Setting up golang example project
WORKDIR /go
RUN go get github.com/golang/example/hello

# Tini is the simplest init you could think of
# https://github.com/krallin/tini
ENTRYPOINT ["/sbin/tini", "--"]

USER root
CMD ["/bin/bash"]

RUN [ "cross-build-end" ]
