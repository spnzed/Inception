all:	vol
	@docker-compose -f ./srcs/docker-compose.yml up -d --build
down:
	@docker-compose -f ./srcs/docker-compose.yml down

clean:
	sudo rm -rf ${HOME}/data/mysql/*
	sudo rm -rf ${HOME}/data/wordpress/*
	@docker stop $$(docker ps -qa);
	@docker rm $$(docker ps -qa);
	@docker rmi -f $$(docker images -qa);
	@docker volume rm $$(docker volume ls -q);
	@docker network rm inception;

status:
	@docker ps -a

re: clean all

.PHONY: all down clean re status vol