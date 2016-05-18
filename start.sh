#!/bin/bash
set -x

eyeos-service-ready-notify-cli &

cat > /etc/mysql/conf.d/max_connections.cnf <<MAX_CONN
[mysqld]
max_connections = $MYSQL_MAX_CONNECTIONS
MAX_CONN

# /entrypoint.sh is present in mysql official docker image, and configures
# the initial db and then starts mysqld, when the parameter passed is mysqld
# (with optional flags)
eyeos-run-server --serf --skip-dnsmasq "/entrypoint.sh mysqld"
