*This project has been created as part of the 42 curriculum by ysumeral.*

# Inception

## Description

Inception sets up a small web infrastructure with Docker Compose. Each service has its own custom Dockerfile — no ready-made images, except Debian. Main services: NGINX, WordPress + php-fpm, and MariaDB, each in a separate container on one Docker network. Bonus services: Redis, FTP server, a static website, Adminer, and monitoring (Prometheus, Grafana, node-exporter, cAdvisor).

## Instructions

```bash
make        # build and start
make down   # stop
make clean  # stop and remove volumes/images
make re     # rebuild from scratch
```

See [USER_DOC.md](./USER_DOC.md) and [DEV_DOC.md](./DEV_DOC.md) for more details.

## Resources

- <a href="https://nginx.org/en/docs/http/configuring_https_servers.html">Setup SSL certificate on NGINX</a>
- <a href="https://mariadb.com/docs/server">MariaDB Server Documentation</a>
- <a href="https://www.php.net/manual/en/install.fpm.configuration.php">PHP FastCGI Process Manager (PHP-FPM) Configuration</a>
- <a href="https://redis.io/docs/latest/operate/oss_and_stack/management/config/">Redis Configuration</a>
- <a href="https://manpages.debian.org/testing/vsftpd/vsftpd.conf.5.en.html">VSFTPD.CONF Documantation</a>
- <a href="https://prometheus.io/docs/prometheus/latest/configuration/configuration/">Prometheus Configuration</a>
- <a href="https://grafana.com/docs/grafana/latest/fundamentals/getting-started/first-dashboards/get-started-grafana-prometheus/">Grafana and Prometheus</a>
- <a href="https://github.com/google/cadvisor/blob/master/docs/running.md">Running cAdvisor</a>
- <a href="https://github.com/prometheus/node_exporter/blob/master/README.md">Node Exporter README Documentation</a>

**AI usage:** Used to prepare documentation files (README, USER_DOC, DEV_DOC), and to understand what the services, especially the bonus ones, are and how they work.

## Project description

This project builds a secure Docker-based web infrastructure consisting of NGINX, WordPress, and MariaDB with persistent storage and HTTPS support.

**Virtual Machines vs Docker**
A VM runs a full OS with its own kernel. This makes it heavier and slower to start. A Docker container shares the host kernel, which makes it lighter and faster to start. This is why Docker is a better fit for running multiple isolated services on one machine.

**Secrets vs Environment Variables**
Environment variables in `.env` are simple, but not fully secure — they can be read with `docker inspect`. Docker secrets are only visible inside the container that needs them. This keeps passwords out of reach.

**Docker Network vs Host Network**
Host network removes isolation and exposes container ports directly on the host. A custom Docker network keeps containers isolated, lets them communicate by service name, and only exposes the ports that are explicitly opened.

**Docker Volumes vs Bind Mounts**
A bind mount ties a container to one exact folder on the host, which limits portability. A named volume is managed by Docker, easier to move and back up, and still stores data on disk, at `/home/ysumeral/data/...`.