# FROM wordpress:php7.3-fpm
FROM wordpress:6.7.2-php8.3-fpm

# Update and install necessary packages
# RUN apt-get update -y && apt-get install -y \
#     wget \
#     curl

# Create the WordPress directory
# RUN mkdir -p /var/www/html

WORKDIR /var/www/html

# Copy scripts and configuration files directly to their final locations
COPY ./tools/script.sh /tmp/script.sh

# COPY ./tools/wp-config.php /var/www/html/wp-config.php



# RUN sed -i 's/\/run\/php\/php7.3-fpm.sock/wordpress:9000/g' /usr/local/etc/php-fpm.d/www.conf \
#     && sed -i 's/;request_terminate_timeout = 0/request_terminate_timeout = 300/g' /usr/local/etc/php-fpm.d/www.conf

# Install sendmail and curl (needed for wp-cli)
# RUN apt-get update && apt-get install -y sendmail

# Install WP-CLI properly
# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
#     && chmod +x wp-cli.phar \
#     && mv wp-cli.phar /usr/local/bin/wp \
#     && wp --info

# Set permissions for the script
RUN chmod +x /tmp/script.sh

# WORKDIR /var/www/html

ENTRYPOINT ["sh", "-c",  "docker-entrypoint.sh php-fpm & sleep 10 && /tmp/script.sh && wait"]