#!/bin/bash

# exit on any error
set -e

hostnamectl set-hostname master

# Configure the salt-master
# Auto accept all keys from minions that try to join
mkdir -p /etc/salt/master.d
cat <<EOF >/etc/salt/master.d/auto-accept.conf
auto_accept: True
EOF

ln -sfv /vagrant/salt-root/salt /srv/salt

# 163报错,aliyun未提供文件.
curl -sS -L http://mirrors.163.com/.help/sources.list.trusty |sed 's/163/aliyun/g' > /etc/apt/sources.list

# Install Salt Master
#
# -M installs the master
# -N does not install the minion
curl -sS -L --connect-timeout 20 --retry 6 --retry-delay 10 https://bootstrap.saltstack.com | sh -s -- -M -N
