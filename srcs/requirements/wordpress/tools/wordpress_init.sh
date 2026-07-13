#!/bin/bash

set -e

MYSQL_PASS=$(cat /run/secrets/db_password | tr -d '\n')
WP_USER_PASS=$(cat /run/secrets/wp_password | tr -d '\n')
WP_ADMIN_PASS=$(cat /run/secrets/wp_admin_password | tr -d '\n')

if [ ! -f /var/www/html/wp-config.php ]; then
    echo "WordPress: wordPress will be set up..."

    wp core download --allow-root --path=/var/www/html

    wp config create --allow-root --path=/var/www/html \
        --dbname="${MYSQL_DATABASE}" \
        --dbuser="${MYSQL_USER}" \
        --dbpass="${MYSQL_PASS}" \
        --dbhost=mariadb

    wp core install --allow-root --path=/var/www/html \
        --url="https://${DOMAIN_NAME}" \
        --title="ysumeral" \
        --admin_user="${WP_ADMIN_USER}" \
        --admin_password="${WP_ADMIN_PASS}" \
        --admin_email="${WP_ADMIN_EMAIL}" \
        --skip-email

    wp user create --allow-root --path=/var/www/html \
        "${WP_USER}" "${WP_USER_EMAIL}" \
        --role=author \
        --user_pass="${WP_USER_PASS}"

    wp config set WP_REDIS_HOST redis --allow-root --path=/var/www/html
    wp config set WP_REDIS_PORT 6379 --raw --allow-root --path=/var/www/html
    wp config set WP_CACHE_KEY_SALT $DOMAIN_NAME --allow-root --path=/var/www/html
 	wp config set WP_REDIS_CLIENT phpredis --allow-root --path=/var/www/html
    wp config set WP_CACHE true --raw --allow-root --path=/var/www/html
    wp plugin install redis-cache --activate --allow-root --path=/var/www/html
    wp redis enable --allow-root --path=/var/www/html

    echo "WordPress: WordPress is set up."
else
    echo "WordPress: Already set up, skipping..." 
fi
    
exec "$@"