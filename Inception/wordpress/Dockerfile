# FROM wordpress:php7.3-fpm
FROM wordpress:6.7.2-php8.3-fpm

# Update and install necessary packages
RUN apt-get update -y && apt-get install -y \
    wget \
    curl

WORKDIR /var/www/html

# Copy scripts and configuration files directly to their final locations
COPY ./tools/script.sh /tmp/script.sh


# Install WP-CLI properly
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp \
    && wp --info

# Set permissions for the script
RUN chmod +x /tmp/script.sh

ENTRYPOINT ["sh", "-c",  "docker-entrypoint.sh php-fpm & sleep 30 && /tmp/script.sh && wait"]
