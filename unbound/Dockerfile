# Run a unbound dns server in a container.
#
# docker run --rm -it -p 53:53/udp -e DEBUG=true --name unbound-dns 181gaming/unbound
#
FROM ubuntu
LABEL maintainer "Nicholas Houle <181gaming@gmail.com>"
ENV VERSION 1.6.7

RUN apt-get update && apt-get install -y \
	apt-transport-https \
	ca-certificates \
	dnsutils

RUN apt-get install -y unbound

WORKDIR /etc/unbound/unbound.conf.d
COPY unbound_srv.conf unbound_srv.conf
COPY unbound_ext.conf unbound_ext.conf
COPY root-auto-trust-anchor-file.conf root-auto-trust-anchor-file.conf

WORKDIR /
COPY start.sh start.sh

EXPOSE 53/udp

RUN ["chmod", "+x", "/start.sh"]

CMD ["/bin/bash"]
ENTRYPOINT ["/start.sh"]
