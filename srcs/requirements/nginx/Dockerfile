FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    nginx \
    openssl && \
    rm -rf /var/lib/apt/lists/*

COPY conf/nginx.conf /etc/nginx/nginx.conf

COPY tools/nginx_init.sh /usr/local/bin/nginx_init.sh
RUN chmod +x /usr/local/bin/nginx_init.sh
ENTRYPOINT ["/usr/local/bin/nginx_init.sh"]

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]