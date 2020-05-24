FROM ubuntu:18.04
LABEL maintainer="jaiganeshc@gmail.com"

RUN apt update
RUN apt upgrade -y
RUN export DEBIAN_FRONTEND=noninteractive
RUN apt install -y tzdata
RUN dpkg-reconfigure --frontend noninteractive tzdata
RUN apt install -y software-properties-common apache2

RUN rm -rf /var/cache/apt/*

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

RUN a2enmod headers
RUN a2enmod rewrite
RUN a2enmod expires

RUN service apache2 restart
EXPOSE 80

