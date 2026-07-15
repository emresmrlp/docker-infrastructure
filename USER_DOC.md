# User Documentation

## Services

- NGINX: entrypoint, serves the site over HTTPS (port 443)
- WordPress + php-fpm: the website and admin panel
- MariaDB: database
- Redis: cache for WordPress
- FTP server: access to the WordPress files (port 21)
- Adminer: web UI for the database
- Static website: separate non-PHP site (port 9200)
- Prometheus, Grafana (port 3000), node-exporter, cAdvisor: monitoring

Ports open from outside: 443, 21, 9200, 3000.

## Start / stop

```bash
make        # build and start
make down   # stop
make clean  # stop and remove volumes/images
make re     # rebuild from scratch
```

Containers restart automatically if they crash.

## Access

- Website: https://ysumeral.42.fr
- WP admin: https://ysumeral.42.fr/wp-admin
- FTP: ysumeral.42.fr, port 21
- Static site: http://ysumeral.42.fr:9200
- Grafana: http://ysumeral.42.fr:3000

The browser will warn about the self-signed certificate on the HTTPS site — this is normal, just accept it.

## Credentials

Not stored in the Dockerfiles or in Git. Two files hold them:

- `srcs/.env` — non-sensitive config (domain, usernames, db name)
- `secrets/` — one file per password, used as Docker secrets: `ftp_password.txt`, `grafana_password.txt`, `wp_password.txt`, `wp_admin_password.txt`, `db_password.txt`, `db_root_password.txt`

Both are gitignored and must be created locally before running `make`.

## Checking the services

```bash
make ps
make logs
```

Everything is fine when all containers show as running and the site loads at https://ysumeral.42.fr.