NAME = inception
DOCKER_COMPOSE = docker-compose -f srcs/docker-compose.yml

all: up

up:
	@mkdir -p /home/aaespino/data/wordpress
	@mkdir -p /home/aaespino/data/mariadb
	$(DOCKER_COMPOSE) up -d --build

down:
	$(DOCKER_COMPOSE) down

clean: down
	docker system prune -a --force

fclean: clean
	sudo rm -rf /home/aaespino/data/wordpress/*
	sudo rm -rf /home/aaespino/data/mariadb/*

re: fclean all

.PHONY: all up down clean fclean re