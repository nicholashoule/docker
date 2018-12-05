# Unbound DNS Resolver using cloudflare-dns.com

## Use this command to start the container: 

```
docker run --rm -it --name unbound-cloudflare 181gaming/unbound:1.8
```

## Versions:

* 1.8 [1.8/Dockerfile](https://github.com/nicholashoule/docker/tree/master/unbound/1.8)

## Information:

Unbound is set to expose 53/udp, so you'll need to point your DNS at the IPv4 address.

### cloudflare-dns.com

```

1.1.1.1
1.0.0.1

```

### Links:

[From Wikipedia, Unbound](https://en.wikipedia.org/wiki/Unbound_%28DNS_server%29)

Unbound is a validating, recursive, and caching DNS resolver product from NLnet Labs. It is distributed free of charge in open-source form under the BSD license.
