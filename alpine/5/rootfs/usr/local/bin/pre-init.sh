#!/bin/sh
# Create a link to .env file so that APP_KEY is persistent across container updates
# To update it, simply remove the file and it will be regenerate on next boot
if [[ ! -f /var/www/app/storage/.env ]]; then
  touch /var/www/app/storage/.env

  if [[ "$(cat /var/www/app/storage/.env | grep APP_KEY)" == "" ]];then
    echo APP_KEY missing from storage/.env, generating APP_KEY
    echo "APP_KEY=$(php artisan key:generate --show)" >>/var/www/app/storage/.env
  fi
fi

export "$(grep APP_KEY /var/www/app/storage/.env)"

php artisan config:cache

/usr/local/bin/genssl.sh

exec "$@"
