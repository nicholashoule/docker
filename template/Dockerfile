# Run a docker container service
#
# docker run --rm -it --name golang-dev 181gaming/[name]
#
# Information:
#
FROM ubuntu:latest
MAINTAINER Nicholas Houle <181gaming@gmail.com>

ENV NAME=name-dev \
    DEBIAN_FRONTEND=noninteractive \
    PATH=$PATH:/app/bin:/usr/local/app/bin \
    APP_PATH=/app

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

USER root
CMD ["/bin/bash"]
