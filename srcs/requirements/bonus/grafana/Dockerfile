FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    ca-certificates && \
    wget -O /tmp/grafana.deb \
    https://dl.grafana.com/oss/release/grafana_13.0.0_amd64.deb && \
    apt-get install -y /tmp/grafana.deb && \
    rm -rf /tmp/grafana.deb /var/lib/apt/lists/*

COPY conf/grafana.ini /etc/grafana/grafana.ini

EXPOSE 3000

COPY tools/grafana_init.sh /usr/local/bin/grafana_init.sh
RUN chmod +x /usr/local/bin/grafana_init.sh
ENTRYPOINT ["/usr/local/bin/grafana_init.sh"]

CMD ["/usr/sbin/grafana-server", "--homepath=/usr/share/grafana"]