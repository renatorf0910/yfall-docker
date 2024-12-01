# FILE TO RUN PROJECT
PROJECT_NAME=yfall-docker

DOCKER_COMPOSE=docker-compose
COMPOSE_FILE=docker-compose.yml

build:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) build

up: build
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) up --build

down:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) down

restart: down up

exec-backend:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) exec yfall-docker_backend /bin/bash

exec-frontend:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) exec yfall-docker_frontend /bin/bash

test-backend:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) exec yfall-docker_backend pytest

test-frontend:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) exec yfall-docker_frontend npm test

clean:
	docker system prune -f

rmi:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) down --rmi all
