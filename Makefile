NAME := inception

${NAME}: all

all: build

build:
	mkdir -p ~/data/wordpress
	mkdir -p ~/data/mariadb
	docker-compose up -d --build

clear:
	docker-compose down
	docker volume rm $(shell docker volume ls -q)

rebuild: clear build

start:
	docker-compose start

stop:
	docker-compose stop

restart: stop start

prune:
	docker system prune -a
	docker volume prune

purge: clear prune
