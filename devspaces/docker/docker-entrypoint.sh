#!/bin/bash

echo "Starting PostgreSql 11..." >&2
su -p -c "/usr/lib/postgresql/11/bin/pg_ctl -t 5 -w -D /var/lib/postgresql/11/main -l /var/log/postgresql/postgresql-11-main.log -o '-c config_file=/etc/postgresql/11/main/postgresql.conf' start" postgres

echo "Creating User/DB..." >&2
su -p -c "psql -c \"CREATE ROLE vespene WITH LOGIN PASSWORD 'vespene' CREATEDB\"" postgres
su -p -c "psql -c \"CREATE DATABASE vespene ENCODING 'UTF8' OWNER vespene\"" postgres

exec "$@"