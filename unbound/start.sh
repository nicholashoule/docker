#!/bin/bash
set -e

/usr/sbin/unbound-control-setup
/usr/sbin/unbound-control start > /dev/null 2>&1

printf "
Unbound DNS running
Point your DNS to %s and pass through unbound.

DNS: %s\n" "$(hostname -I)" "$(hostname -I)" && tail -f /dev/stdout
