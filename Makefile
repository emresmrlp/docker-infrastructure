COMPOSE_FILE = ./srcs/docker-compose.yml

DATA_DIR = /home/ysumeral/data
MARIADB_DIR = $(DATA_DIR)/mariadb

all: up

up:
	mkdir -p $(MARIADB_DIR)
	docker compose -f $(COMPOSE_FILE) up -d --build

down:
	docker compose -f $(COMPOSE_FILE) down

start:
	docker compose -f $(COMPOSE_FILE) start

stop:
	docker compose -f $(COMPOSE_FILE) stop

restart:
	docker compose -f $(COMPOSE_FILE) restart

logs:
	docker compose -f $(COMPOSE_FILE) logs -f

list:
	docker compose -f $(COMPOSE_FILE) ps

clean: down

.PHONY: all up down	start stop restart logs