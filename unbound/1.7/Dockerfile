# Run a unbound dns server in a container.
#
# docker run --rm -it --name unbound-cloudflare 181gaming/unbound
#
# cloudflare-dns.com
#
FROM ubuntu:19.04
LABEL maintainer "Nicholas Houle <181gaming@gmail.com>"

ENV NAME=unbound-cloudflare \
    UNBOUND_VERSION=1.7

RUN APT_PACKAGES='apt-transport-https curl ca-certificates dnsutils' && \
    set -x && \
    DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y --no-install-recommends \
      $APT_PACKAGES \
      unbound && \
    apt-get autoremove -y && apt-get clean && \
    rm -fr /tmp/* /var/tmp/* /var/lib/apt/lists/*

WORKDIR /etc/unbound/unbound.conf.d
COPY unbound_srv.conf unbound_srv.conf
COPY unbound_ext.conf unbound_ext.conf
COPY root-auto-trust-anchor-file.conf root-auto-trust-anchor-file.conf

WORKDIR /
COPY start.sh start.sh

EXPOSE 53/udp

RUN ["chmod", "+x", "/start.sh"]

CMD ["/start.sh"]
ENTRYPOINT ["/start.sh"]
