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




FROM wordpress:php8.4-fpm-alpine

# Create the required directory structure
RUN mkdir -p /Cloud/wordpress

WORKDIR /Cloud/wordpress
# Install sendmail and curl (needed for wp-cli)
RUN apk add --no-cache  curl wget
# Copy custom configuration script
COPY ./conf/script.sh /var/script.sh

# Make the script executable
RUN chmod +x /var/script.sh
# Install WP-CLI properly
RUN echo "memory_limit = 512M" > /usr/local/etc/php/conf.d/memory-limit.ini

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp \
    && wp --info

# Configure PHP-FPM
# RUN sed -i 's/\/run\/php\/php8.4-fpm.sock/wordpress:9000/g' /usr/local/etc/php-fpm.d/www.conf \
#     && sed -i 's/;request_terminate_timeout = 0/request_terminate_timeout = 300/g' /usr/local/etc/php-fpm.d/www.conf


CMD ["sh", "/var/script.sh"]