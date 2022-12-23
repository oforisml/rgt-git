FROM ubuntu:latest
LABEL maintainer="oforisml@gmail.com"

RUN apt update && echo "deb http://repo.mysql.com/apt/ubuntu/ bionic mysql-5.6" > /etc/apt/sources.list.d/mysql.list \
	&& apt-key adv --keyserver pgp.mit.edu --recv-keys 5972E1F5 \
	&& apt-get update && apt-get install -y --no-instal-commends perl pwgen

RUN { \
    #Set MySQL root password for silent installation
    echo mysql-community-server mysql-community-server/root-pass password ''; \
    echo mysql-community-server mysql-community-server/re-root-poss password ''>
    } | debconf-set-selections \
    && apt-get install -y mysql-server \
    && mkdir -p /var/lib/mysql /var/run/mysqld \
    && chown -R mysql:mysql /var/lib/mysql /var/run/mysqld \
    && chmod 777 /var/run/mysql
 
VOLUME /var/lib/mysql
