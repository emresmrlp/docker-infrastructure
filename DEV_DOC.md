# Developer Documentation

## Setup

Needs a Debian VM with Docker and Docker Compose, and `login.42.fr` pointing to the VM's IP.

Two things to prepare before running anything:

- `srcs/.env` — non-secret config used by docker-compose.yml
- `secrets/` — one plaintext file per password:
  - ftp_password.txt
  - grafana_password.txt
  - wp_password.txt
  - wp_admin_password.txt
  - db_password.txt
  - db_root_password.txt

Neither is committed to Git. No passwords in any Dockerfile.

## Build & launch

```bash
make        # build images and start (docker compose up --build -d)
make down   # docker compose down
make clean  # down + remove volumes and images
make re     # clean + make
```

Each service has its own Dockerfile under `srcs/requirements/<service>/`, built on Debian, no `latest` tag, no pulled prebuilt images.

## Managing containers/volumes

```bash
docker compose -f srcs/docker-compose.yml build <service>
docker compose -f srcs/docker-compose.yml up -d <service>
docker exec -it <container> sh
docker volume ls
docker volume inspect <volume>
```

All containers sit on one custom bridge network (no host network, no --link) and talk to each other by service name.

## Data persistence

Two named volumes (not bind mounts):

- WordPress files → `/home/ysumeral/data/wordpress`
- MariaDB data → `/home/ysumeral/data/mariadb`

Removing them (`docker volume rm` or `make clean`) wipes the site and database.