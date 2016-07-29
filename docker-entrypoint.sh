#!/bin/bash
if [ -n "$MYSQL_ROOT_PASSWORD" -a ! -n "$MYSQL_DB" ]; then
  ansible-playbook -i "localhost," -c local /docker-entrypoint.yml \
  --extra-vars "mysql_root_password=${MYSQL_ROOT_PASSWORD}"
fi
if [ -n "$MYSQL_ROOT_PASSWORD" -a -n "$MYSQL_DB" ]; then
  ansible-playbook -i "localhost," -c local /docker-entrypoint.yml \
  --extra-vars "mysql_root_password=${MYSQL_ROOT_PASSWORD},mysql_db=${MYSQL_DB}"
fi
if [ ! -n "$MYSQL_ROOT_PASSWORD" -a -n "$MYSQL_DB" ]; then
  ansible-playbook -i "localhost," -c local /docker-entrypoint.yml \
  --extra-vars "mysql_db=${MYSQL_DB}"
fi
sleep 5
exec "$@"
