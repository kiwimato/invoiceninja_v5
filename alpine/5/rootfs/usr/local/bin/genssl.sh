#!/bin/sh
SSL_HOSTNAME=${SSL_HOSTNAME:-tower}

DIR="/etc/nginx/ssl/"
mkdir -p $DIR

if [[ -f "$DIR/invoiceninja.crt" ]];then
	echo "Cert already generated"
	exit
fi

if [[ -n "$SSL_KEY" ]] && [[ -n "$SSL_CERT" ]];then
  echo "$SSL_KEY" > $DIR/invoiceninja.key
  echo "$SSL_CERT" > $DIR/invoiceninja.crt
  exit # don't continue if a cert was provided
fi

# Generate our key
openssl genrsa 4096 > $DIR/invoiceninja.key

# Create the self-signed certificate for all invoiceninja
openssl req -new -x509 -nodes -sha256 -days 3650 -key $DIR/invoiceninja.key << ANSWERS > $DIR/invoiceninja.crt
JP
NinjaTown
NinjaCity
invoiceninja
Me
$SSL_HOSTNAME
admin@localhost
ANSWERS
