# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: atabiti <atabiti@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/17 11:46:34 by atabiti           #+#    #+#              #
#    Updated: 2022/11/28 10:57:17 by atabiti          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# FROM debian:buster
# RUN apt-get update -y && apt-get install -y mariadb-server
# EXPOSE 3306
# COPY ./conf/input ./input
# RUN sed -i 's/127.0.0.1/*/g' /etc/mysql/mariadb.conf.d/50-server.cnf 
# RUN  /etc/init.d/mysql start && mariadb -u root &&  mysql < ./input
# CMD mysqld 


FROM mariadb:latest

# COPY ./conf/input /docker-entrypoint-initdb.d/init.sql
# EXPOSE 3306