FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    ca-certificates \
    tar && \
    wget -O /tmp/node_exporter.tar.gz \
    https://github.com/prometheus/node_exporter/releases/download/v1.12.0/node_exporter-1.12.0.linux-amd64.tar.gz && \
    tar -xzf /tmp/node_exporter.tar.gz -C /tmp && \
    cp /tmp/node_exporter-1.12.0.linux-amd64/node_exporter /usr/local/bin/ && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 9100

CMD ["/usr/local/bin/node_exporter"]