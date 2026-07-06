#!/bin/bash

if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Mariadb already set up!"
fi

exec "$@"
