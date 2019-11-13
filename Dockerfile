FROM ubuntu:18.04
MAINTAINER Chevy Lin

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install nginx-full libnginx-mod-rtmp php-fpm openssl net-tools nano -y

COPY settings/etc/nginx/nginx.conf /etc/nginx/nginx.conf
COPY settings/etc/nginx/sites-available/default /etc/nginx/sites-available/default

RUN mkdir /var/www/html/vod
RUN mkdir /var/www/html/live
RUN mkdir /var/www/html/record
RUN mkdir /var/www/html/stat

COPY settings/etc/nginx/nginx.conf /etc/nginx/nginx.conf
COPY settings/etc/nginx/sites-available/default /etc/nginx/sites-available/default
COPY settings/var/www/html/stat.xsl /var/www/html/stat.xsl
COPY settings/var/www/html/phpinfo.php /var/www/html/phpinfo.php

RUN chown -R www-data:www-data /var/www/html

RUN echo "service php7.2-fpm start & service nginx start" > /usr/sbin/server.sh
RUN chmod 755 /usr/sbin/server.sh




