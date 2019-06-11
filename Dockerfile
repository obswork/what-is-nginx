FROM ubuntu:18.04
RUN apt-get update && apt-get install -y nginx curl apache2-utils
EXPOSE 80
CMD /usr/sbin/nginx && tail -f /dev/null
