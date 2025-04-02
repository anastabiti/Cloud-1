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

# FROM wordpress:latest
# EXPOSE 9000
# #fix Error: Your PHP installation appears to be missing the MySQL extension which is required by WordPress. by installing php-mysql
# RUN   apt-get update &&  apt-get install -y php php-fpm php-mysql curl wget sendmail:
# # RUN   mkdir -p /var/www/html/ && cd  /var/www/html/ \
# RUN   mkdir  /atabiti/ && cd  /atabiti \
#          && wget https://wordpress.org/latest.tar.gz \
#           &&  tar -xvzf latest.tar.gz \
#             && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
#                && chmod 111 wp-cli.phar \
#                    &&  mv wp-cli.phar /usr/local/bin/wp
# RUN  sed -i 's/\/run\/php\/php7.3-fpm.sock/wordpress:9000/g' /etc/php/7.3/fpm/pool.d/www.conf
# RUN  sed -i 's/;request_terminate_timeout = 0/request_terminate_timeout = 300/g' /etc/php/7.3/fpm/pool.d/www.conf
# RUN service php7.3-fpm start; service php7.3-fpm stop
# COPY ./conf/script.sh /var/script.sh
# CMD sh /var/script.sh

FROM wordpress:php7.3-fpm

# Create the required directory structure
RUN mkdir -p /atabiti/wordpress

# Copy custom configuration script
COPY ./conf/script.sh /var/script.sh

# Make the script executable
RUN chmod +x /var/script.sh

# Configure PHP-FPM
RUN sed -i 's/\/run\/php\/php7.3-fpm.sock/wordpress:9000/g' /usr/local/etc/php-fpm.d/www.conf \
    && sed -i 's/;request_terminate_timeout = 0/request_terminate_timeout = 300/g' /usr/local/etc/php-fpm.d/www.conf

# Install sendmail and curl (needed for wp-cli)
RUN apt-get update && apt-get install -y sendmail curl wget

# Install WP-CLI properly
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp \
    && wp --info

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Set the working directory to match what nginx expects
WORKDIR /atabiti/wordpress

# Run the setup script and then PHP-FPM
CMD ["bash", "/var/script.sh"]



#MAN
#chmod 111 make it executable for all