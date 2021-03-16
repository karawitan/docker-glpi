ARCH=$(shell uname -m)

all: run.$(ARCH)

restart: stop run
	
run.armv7l:
	docker build -t glpi:arm32v7 -f Dockerfile.arm32v7 .
	/home/pi/.local/bin/docker-compose up -d

run.amd64:
	docker-compose up -d

stop:
	docker-compose down --remove-orphans 
