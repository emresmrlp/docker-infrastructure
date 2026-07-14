FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    ca-certificates \
    tar && \
    wget -O /tmp/prometheus.tar.gz \
        https://github.com/prometheus/prometheus/releases/download/v3.13.0/prometheus-3.13.0.linux-amd64.tar.gz && \
    tar -xzf /tmp/prometheus.tar.gz -C /tmp && \
    cp /tmp/prometheus-3.13.0.linux-amd64/prometheus /usr/local/bin/ && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /prometheus

COPY conf/prometheus.yml /etc/prometheus/prometheus.yml

EXPOSE 9090

CMD ["/usr/local/bin/prometheus", "--config.file=/etc/prometheus/prometheus.yml"]