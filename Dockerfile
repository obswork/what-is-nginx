FROM ubuntu:18.04
RUN apt-get update && apt-get install -y nginx curl
EXPOSE 80
CMD /usr/sbin/nginx && tail -f /dev/null
