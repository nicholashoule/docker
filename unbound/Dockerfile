# Run a unbound dns server in a container.
#
# docker run --rm -it -p 53:53/udp \
# 	-e DEBUG=true \
# 	--name unbound-dns \
# 	181gaming/unbound
FROM ubuntu:unbound
LABEL maintainer "Nicholas Houle <181gaming@gmail.com>"

RUN apt-get update && apt-get install -y \
	apt-transport-https \
	ca-certificates

EXPOSE 53:53/udp

WORKDIR /etc/unbound/unbound.conf.d
COPY unbound_srv.conf unbound_srv.conf
COPY unbound_ext.conf unbound_ext.conf
COPY root-auto-trust-anchor-file.conf root-auto-trust-anchor-file.conf

WORKDIR /
COPY start.sh start.sh

RUN ["chmod", "+x", "/start.sh"]

ENTRYPOINT ["/start.sh"]
