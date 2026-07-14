FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    ca-certificates && \
    wget -O /usr/local/bin/cadvisor \
    https://github.com/google/cadvisor/releases/download/v0.57.0/cadvisor-v0.57.0-linux-amd64 && \
    chmod +x /usr/local/bin/cadvisor && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 8080

CMD ["/usr/local/bin/cadvisor"]