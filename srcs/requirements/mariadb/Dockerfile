FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld

COPY tools/mariadb_init.sh /usr/local/bin/mariadb_init.sh
RUN chmod +x /usr/local/bin/mariadb_init.sh
ENTRYPOINT ["/usr/local/bin/mariadb_init.sh"]

CMD ["mariadbd", "--user=mysql"]

EXPOSE 3306