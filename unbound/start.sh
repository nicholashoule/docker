#!/bin/bash
set -e

# Variables
declare -l d_ip_v4 d_dns_host d_unbound_v
d_ip_v4=$(hostname -I)
d_dns_host='cloudflare-dns.com'
d_unbound_v='1.7'

# Ensure unbound setup
#/usr/sbin/unbound-anchor
/usr/sbin/unbound-control-setup

# Information
printf "\nUnbound %s DNS %s
Point your DNS to %s and pass through unbound.

DNS (IPv4): %s\n" "${d_unbound_v}" "${d_dns_host}" "${d_ip_v4}" "${d_ip_v4}"

# Start the service
#/usr/sbin/unbound-control -c /etc/unbound/unbound.conf start && tail -f /dev/null
/usr/sbin/service unbound start && tail -f /dev/null
