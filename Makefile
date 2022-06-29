PROJECT = inception

all:
	docker-compose -f ./srcs/docker-compose.yml up -d
clean:
	docker-compose -f ./srcs/docker-compose.yml down

fclean:
	docker-compose -f ./srcs/docker-compose.yml down --rmi all --volumes
	rm -rf ./srcs/data

re: clean all

.PHONY: all clean fclean re