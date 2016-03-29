#!/bin/bash

# exit on any error
set -e

hostnamectl set-hostname minion

# Install Salt
curl -sS -L --connect-timeout 20 --retry 6 --retry-delay 10 https://bootstrap.saltstack.com | sh -s

cat <<EOF >/etc/salt/minion.d/master.conf
master: $MASTER_IP
EOF
