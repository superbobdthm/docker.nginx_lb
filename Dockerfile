FROM ubuntu:16.04

MAINTAINER Douglas Mueller <superbob@dthm.net>

RUN apt-get update && apt-get install -y nginx openssl && \
apt-get clean && rm -Rf /var/lib/apt/lists

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

VOLUME ["/etc/nginx"]
VOLUME ["/etc/letsencrypt"]
VOLUME ["/data/letsencrypt"]

EXPOSE 80 443


COPY src/entrypoint.sh /
RUN chmod 755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

#Start Service
CMD ["nginx","-g", "daemon off;"]