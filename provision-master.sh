#!/bin/bash

# exit on any error
set -e

hostnamectl set-hostname ${MASTER_IP}

# Install Salt Master
#
# -M installs the master
# -N does not install the minion
curl -sS -L --connect-timeout 20 --retry 6 --retry-delay 10 https://bootstrap.saltstack.com | sh -s -- -M -N
