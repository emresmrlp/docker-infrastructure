#!/bin/bash

SSL_DIR="/etc/nginx/ssl"
SSL_KEY="${SSL_DIR}/nginx.key"
SSL_CERT="${SSL_DIR}/nginx.crt"

if [ ! -f "$SSL_CERT" ] || [ ! -f "$SSL_KEY" ]; then
    echo "NGINX: SSL certificate will be set up..."

    mkdir -p "$SSL_DIR"

    openssl req -x509 -nodes \
        -days 365 \
        -newkey rsa:2048 \
        -keyout "$SSL_KEY" \
        -out "$SSL_CERT" \
        -subj "/C=TR/ST=Istanbul/L=Sariyer/CN=ysumeral.42.fr"

    echo "NGINX: SSL certificate is set up."
fi

exec "$@"
