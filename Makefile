#### Usage:
##
##   $ make <command> <arguments>
##

help:                              ## Print help
	@grep -e "##" Makefile | grep -v grep

build:                             ## Build my-nginx image
	@docker build -t my-nginx .

run:                               ## Run my-nginx container on port 9200
	@docker run -dit --rm --name my-nginx -v $(PWD)/nginx:/etc/nginx \
		-v $(PWD)/static:/static -p=9200:80 my-nginx

shell:
	@docker exec -it my-nginx /bin/bash

reload:
	@docker exec -it my-nginx nginx -s reload

stop:
	@docker stop my-nginx