PROJECT = inception

all:
	mkdir -p /home/lwray/data/db
	mkdir -p /home/lwray/data/wordpress
	docker-compose -f ./srcs/docker-compose.yml -p inception up -d
clean:
	docker-compose -f ./srcs/docker-compose.yml -p inception down

fclean:
	docker-compose -f ./srcs/docker-compose.yml -p inception down --rmi all --volumes
	rm -rf /home/lwray/data

re: clean all

.PHONY: all clean fclean re