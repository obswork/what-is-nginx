#### Usage:
##
##   $ make <command> <arguments>
##

help:                              ## Print help
	@grep -e "##" Makefile | grep -v grep

build:                             ## Build my-nginx image
	@docker build -t my-nginx .

run:                               ## Run my-nginx container on port 9200
	@docker run -dit --rm -v $(PWD)/nginx-confs:/home/nginx -p=9200:80 my-nginx