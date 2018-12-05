# Run a unbound dns server in a container.
#
# docker run --rm -it --name unbound-cloudflare 181gaming/unbound
#
# cloudflare-dns.com
#
FROM fedora:29
LABEL maintainer "Nicholas Houle <181gaming@gmail.com>"

ENV NAME=unbound-cloudflare \
    UNBOUND_VERSION=1.8

RUN DNF_PACKAGES='gcc glibc-common initscripts hostname net-tools iputils iproute curl ca-certificates vim' && \
    set -x && \
    dnf update -y && dnf install -y --setopt=tsflags=nodocs \
      $DNF_PACKAGES \
      unbound && \
    dnf autoremove -y && dnf clean all && \
    rm -fr /tmp/* /var/tmp/* /var/lib/dnf/*

WORKDIR /etc/unbound
RUN rm /etc/unbound/unbound.conf
COPY unbound.conf unbound.conf
RUN chown root:unbound /etc/unbound/unbound.conf

WORKDIR /etc/unbound/conf.d
COPY unbound_srv.conf unbound_srv.conf
COPY unbound_ext.conf unbound_ext.conf
COPY root-auto-trust-anchor-file.conf root-auto-trust-anchor-file.conf
RUN \
   chown -R root:unbound /etc/unbound/conf.d && \
   rm /etc/unbound/conf.d/example.com.conf

WORKDIR /var/lib
RUN chown -R root:unbound /var/lib/unbound

WORKDIR /
COPY start.sh start.sh
RUN ["chmod", "+x", "/start.sh"]

EXPOSE 53/udp
ENTRYPOINT ["/start.sh"]
CMD ["-d", "-c", "/etc/unbound/unbound.conf", "-v"]