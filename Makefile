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

shell:                             ## Run bash shell in running my-nginx container
	@docker exec -it my-nginx /bin/bash

reload:                            ## Reload nginx configs w/in bash container
	@docker exec -it my-nginx nginx -s reload

stop:                              ## Stop my-nginx container
	@docker stop my-nginx

load-test:                         ## Test site load w/ 10K requests and 10 open connections
	@docker exec -it my-nginx ab -n 1000 -c 10 'http://localhost:80/'

logs:                              ## Tail container nginx logs
	@docker exec -it my-nginx tail -f /var/log/nginx/access.log