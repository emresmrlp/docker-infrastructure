FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    php-fpm \
    php-cli \
    php-mysqli \
    php-curl \
    php-gd \
    php-mbstring \
    php-xml \
    php-zip \
    php-intl \
    curl \
    ca-certificates \
    mariadb-client

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

RUN mkdir -p /run/php && chown www-data:www-data /run/php

RUN curl -o /usr/local/bin/wp \
    https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x /usr/local/bin/wp

COPY tools/wordpress_init.sh /usr/local/bin/wordpress_init.sh
RUN chmod +x /usr/local/bin/wordpress_init.sh
ENTRYPOINT ["/usr/local/bin/wordpress_init.sh"]

CMD ["php-fpm8.2", "-F"]

EXPOSE 9000