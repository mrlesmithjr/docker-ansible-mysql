#!/bin/bash
if [ -n "$MYSQL_ROOT_PASSWORD" -a ! -n "$MYSQL_DATABASE" -a ! -n "$MYSQL_USER" -a ! -n "$MYSQL_PASSWORD" ]; then
  ansible-playbook -i "localhost," -c local /docker-entrypoint.yml \
  --extra-vars "mysql_root_password=${MYSQL_ROOT_PASSWORD}"
fi
if [ -n "$MYSQL_ROOT_PASSWORD" -a -n "$MYSQL_DATABASE" -a ! -n "$MYSQL_USER" -a ! -n "$MYSQL_PASSWORD" ]; then
  ansible-playbook -i "localhost," -c local /docker-entrypoint.yml \
  --extra-vars "mysql_root_password=${MYSQL_ROOT_PASSWORD} mysql_db=${MYSQL_DATABASE}"
fi
if [ ! -n "$MYSQL_ROOT_PASSWORD" -a -n "$MYSQL_DATABASE" -a ! -n "$MYSQL_USER" -a ! -n "$MYSQL_PASSWORD" ]; then
  ansible-playbook -i "localhost," -c local /docker-entrypoint.yml \
  --extra-vars "mysql_db=${MYSQL_DATABASE}"
fi
if [ -n "$MYSQL_ROOT_PASSWORD" -a -n "$MYSQL_DATABASE" -a -n "$MYSQL_USER" -a -n "$MYSQL_PASSWORD" ]; then
  ansible-playbook -i "localhost," -c local /docker-entrypoint.yml \
  --extra-vars "mysql_root_password=${MYSQL_ROOT_PASSWORD} mysql_db=${MYSQL_DATABASE} mysql_user=${MYSQL_USER} mysql_pass=${MYSQL_PASSWORD}"
fi
if [ ! -n "$MYSQL_ROOT_PASSWORD" -a -n "$MYSQL_DATABASE" -a -n "$MYSQL_USER" -a -n "$MYSQL_PASSWORD" ]; then
  ansible-playbook -i "localhost," -c local /docker-entrypoint.yml \
  --extra-vars "mysql_db=${MYSQL_DATABASE} mysql_user=${MYSQL_USER} mysql_pass=${MYSQL_PASSWORD}"
fi

sleep 5
exec "$@"
