#!/bin/bash

set -e

FTP_PASS=$(tr -d '\n' < /run/secrets/ftp_password)

if ! id "$FTP_USER" >/dev/null 2>&1; then
    useradd -m -d /var/www/html -s /bin/bash "$FTP_USER"
    echo "$FTP_USER:$FTP_PASS" | chpasswd
fi

exec "$@"