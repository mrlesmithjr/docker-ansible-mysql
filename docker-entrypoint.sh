#!/bin/bash
if [ -n "$MYSQL_ROOT_PASSWORD" -a ! -n "$MYSQL_DB" -a ! -n "$MYSQL_USER" -a ! -n "$MYSQL_PASS" ]; then
  ansible-playbook -i "localhost," -c local /docker-entrypoint.yml \
  --extra-vars "mysql_root_password=${MYSQL_ROOT_PASSWORD}"
fi
if [ -n "$MYSQL_ROOT_PASSWORD" -a -n "$MYSQL_DB" -a ! -n "$MYSQL_USER" -a ! -n "$MYSQL_PASS" ]; then
  ansible-playbook -i "localhost," -c local /docker-entrypoint.yml \
  --extra-vars "mysql_root_password=${MYSQL_ROOT_PASSWORD} mysql_db=${MYSQL_DB}"
fi
if [ ! -n "$MYSQL_ROOT_PASSWORD" -a -n "$MYSQL_DB" -a ! -n "$MYSQL_USER" -a ! -n "$MYSQL_PASS" ]; then
  ansible-playbook -i "localhost," -c local /docker-entrypoint.yml \
  --extra-vars "mysql_db=${MYSQL_DB}"
fi
if [ -n "$MYSQL_ROOT_PASSWORD" -a -n "$MYSQL_DB" -a -n "$MYSQL_USER" -a -n "$MYSQL_PASS" ]; then
  ansible-playbook -i "localhost," -c local /docker-entrypoint.yml \
  --extra-vars "mysql_root_password=${MYSQL_ROOT_PASSWORD} mysql_db=${MYSQL_DB} mysql_user=${MYSQL_USER} mysql_pass=${MYSQL_PASS}"
fi
if [ ! -n "$MYSQL_ROOT_PASSWORD" -a -n "$MYSQL_DB" -a -n "$MYSQL_USER" -a -n "$MYSQL_PASS" ]; then
  ansible-playbook -i "localhost," -c local /docker-entrypoint.yml \
  --extra-vars "mysql_db=${MYSQL_DB} mysql_user=${MYSQL_USER} mysql_pass=${MYSQL_PASS}"
fi

sleep 5
exec "$@"
