FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    php-fpm \
    php-mysqli \
    curl \
    ca-certificates && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www/html

RUN curl -L -o /var/www/html/index.php \
    https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php

RUN chown -R www-data:www-data /var/www/html

RUN mkdir -p /run/php && chown www-data:www-data /run/php

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

EXPOSE 8080

STOPSIGNAL SIGQUIT

CMD ["php-fpm8.2", "-F"]