# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: atabiti <atabiti@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/17 11:46:25 by atabiti           #+#    #+#              #
#    Updated: 2022/12/02 09:22:02 by atabiti          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster
EXPOSE 9000
#fix Error: Your PHP installation appears to be missing the MySQL extension which is required by WordPress. by installing php-mysql
RUN   apt-get update &&  apt-get install -y php php-fpm php-mysql curl wget sendmail:
# RUN   mkdir -p /var/www/html/ && cd  /var/www/html/ \
RUN   mkdir  /atabiti/ && cd  /atabiti \
         && wget https://wordpress.org/latest.tar.gz \
          &&  tar -xvzf latest.tar.gz \
            && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
               && chmod 111 wp-cli.phar \
                   &&  mv wp-cli.phar /usr/local/bin/wp
RUN  sed -i 's/\/run\/php\/php7.3-fpm.sock/wordpress:9000/g' /etc/php/7.3/fpm/pool.d/www.conf
RUN  sed -i 's/;request_terminate_timeout = 0/request_terminate_timeout = 300/g' /etc/php/7.3/fpm/pool.d/www.conf
RUN service php7.3-fpm start; service php7.3-fpm stop
COPY ./conf/script.sh /var/script.sh
CMD sh /var/script.sh



#MAN
#chmod 111 make it executable for all