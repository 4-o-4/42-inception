SRCS = ./srcs/

all:
	sudo mkdir -p /home/gplaid/data/wordpress
	sudo mkdir -p /home/gplaid/data/mysql
	cd $(SRCS) && docker-compose up -d

down:
	cd $(SRCS) && docker-compose down

fclean: down
	-docker rm `docker ps -qa`
	-docker rmi -f `docker images -qa`
	-docker volume rm `docker volume ls -q`
	-docker network rm `docker network ls -q`
	sudo rm -rf /home/gplaid/data
