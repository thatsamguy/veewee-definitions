#!/bin/bash
wget -q http://apt.puppetlabs.com/puppetlabs-release_1.0-3_all.deb
dpkg -i puppetlabs-release_1.0-3_all.deb
apt-get update
apt-get -y install puppet
echo "192.168.1.10 puppet puppet.local" >> /etc/hosts
echo "[agent]
report = true

[main]
server=puppet.local
logdir=/var/log/puppet
vardir=/var/lib/puppet
ssldir=/var/lib/puppet/ssl
rundir=/var/run/puppet
factpath=\$vardir/lib/facter
templatedir=\$confdir/templates" > /etc/puppet/puppet.conf
echo "# Defaults for puppet - sourced by /etc/init.d/puppet

# Start puppet on boot?
START=yes

# Startup options
DAEMON_OPTS=\"\"" > /etc/default/puppet
service puppet restart
