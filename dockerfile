FROM nginx:latest

# install certbot
RUN apt update
RUN apt install -y certbot python3-certbot-nginx cron

# deamon mode off
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf
#RUN chown -R www-data:www-data /var/lib/nginx

# expose ports
EXPOSE 80 443

# work dir
WORKDIR /etc/nginx

# add entrypoing
ADD docker-entrypoint.sh .

# make certs dir as volume
VOLUME ["/etc/letsencrypt"]
VOLUME ["/etc/nginx/conf.d"]

RUN mkdir /usr/share/nginx/cert
RUN mkdir /usr/share/nginx/certbot

CMD ["/etc/nginx/docker-entrypoint.sh"]
