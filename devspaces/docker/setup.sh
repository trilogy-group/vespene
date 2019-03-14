#!/bin/bash

apt-get update
apt-get -y install apt-utils
apt-get -y install lsb-release software-properties-common build-essential

curl -s https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -sc)-pgdg main" >> /etc/apt/sources.list.d/pgdg.list

apt-get update
apt-get -y install postgresql-11
sed -i "s;#listen_addresses = 'localhost';listen_addresses = '*'       ;g" /etc/postgresql/11/main/postgresql.conf

pip install --upgrade pip

apt-get autoremove --yes
apt-get clean all
rm -rf /var/lib/apt/lists/*
rm -f /setup.sh

mkdir -p /etc/vespene/settings.d /tmp/vespene/build_root /var/log/vespene
chmod +x make.sh
