#!/bin/bash
set -e

# Variables
declare -g d_ip_v4
declare -g d_dns_host='cloudflare-dns.com'
d_ip_v4=$(hostname -I)

# Ensure unbound setup
/usr/sbin/unbound-control-setup

# Information
printf "Unbound DNS cloudflare-dns.com
Point your DNS to %s and pass through unbound.

DNS (IPv4): %s\n" "${d_ip_v4}" "${d_ip_v4}"

# Start the service
#/usr/sbin/unbound -c /etc/unbound/unbound.conf -d -v
/usr/sbin/service unbound start && tail -f /dev/null
