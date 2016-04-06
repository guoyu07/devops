#!/bin/bash

# exit on any error
set -e

hostnamectl set-hostname ${MINION_NAME}

mkdir -p /etc/salt/minion.d
cat <<EOF >/etc/salt/minion.d/master.conf
master: ${MASTER_IP}
EOF

curl -sS -L http://mirrors.163.com/.help/sources.list.trusty |sed 's/163/aliyun/g' > /etc/apt/sources.list

# Install Salt
curl -sS -L --connect-timeout 20 --retry 6 --retry-delay 10 https://bootstrap.saltstack.com | sh -s
