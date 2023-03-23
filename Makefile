COMPOSE_FILE=docker-compose.yml
DOCKER_ENV_FILE=.docker.env

build:
	docker-compose --env-file $(DOCKER_ENV_FILE) -f $(COMPOSE_FILE) build
start:
	docker-compose --env-file $(DOCKER_ENV_FILE) -f $(COMPOSE_FILE) up -d
stop:
	docker-compose --env-file $(DOCKER_ENV_FILE) -f $(COMPOSE_FILE) down --remove-orphans
restart:
	make stop && make start
register:
	docker-compose --env-file $(DOCKER_ENV_FILE) -f $(COMPOSE_FILE) run register-runner
shell:
	docker-compose --env-file $(DOCKER_ENV_FILE) -f $(COMPOSE_FILE) exec runner sh
logs:
	docker-compose --env-file $(DOCKER_ENV_FILE) -f $(COMPOSE_FILE) logs -f runner

