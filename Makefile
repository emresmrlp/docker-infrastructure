COMPOSE_FILE = ./srcs/docker-compose.yml

DATA_DIR = /home/ysumeral/data
MARIADB_DIR = $(DATA_DIR)/mariadb
WORDPRESS_DIR = $(DATA_DIR)/wordpress

all: up

up:
	mkdir -p $(MARIADB_DIR)
	mkdir -p $(WORDPRESS_DIR)
	docker compose -f $(COMPOSE_FILE) up -d --build

down:
	docker compose -f $(COMPOSE_FILE) down

start:
	docker compose -f $(COMPOSE_FILE) start

stop:
	docker compose -f $(COMPOSE_FILE) stop

re: down up

logs:
	docker compose -f $(COMPOSE_FILE) logs -f

ps:
	docker compose -f $(COMPOSE_FILE) ps

clean:
	docker compose -f $(COMPOSE_FILE) down -v --remove-orphans

.PHONY: all up down	start stop re logs ps clean