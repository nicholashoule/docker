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

RUN APT_PACKAGES='apt-transport-https curl ca-certificates dnsutils net-tools vim' && \
    set -x && \
    DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y --no-install-recommends \
      $APT_PACKAGES \
      unbound && \
    apt-get autoremove -y && apt-get clean && \
    rm -fr /tmp/* /var/tmp/* /var/lib/apt/lists/*

WORKDIR /etc/unbound/unbound.conf.d
COPY unbound_srv.conf unbound_srv.conf
COPY unbound_ext.conf unbound_ext.conf
COPY qname-minimisation.conf qname-minimisation.conf
COPY root-auto-trust-anchor-file.conf root-auto-trust-anchor-file.conf
RUN \
   chown -R root:unbound /etc/unbound/unbound.conf.d

#WORKDIR /var/lib
#RUN chown -R root:unbound /var/lib/unbound

WORKDIR /
COPY start.sh start.sh
RUN ["chmod", "+x", "/start.sh"]

EXPOSE 53/udp
ENTRYPOINT ["/start.sh"]
CMD ["-d", "-c", "/etc/unbound/unbound.conf", "-v"]
