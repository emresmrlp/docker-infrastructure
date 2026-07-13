FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    vsftpd && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/vsftpd/empty

COPY ./conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

EXPOSE 21

COPY tools/ftpserver_init.sh /usr/local/bin/ftpserver_init.sh
RUN chmod +x /usr/local/bin/ftpserver_init.sh
ENTRYPOINT ["/usr/local/bin/ftpserver_init.sh"]

CMD ["vsftpd", "/etc/vsftpd/vsftpd.conf"]