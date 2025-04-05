# # !/bin/bash

# # Check if WordPress is already installed
# if [ ! -f /var/www/html/wp-config.php ]; then
#     cd /var/www/html

#     # Download and extract WordPress
#     # curl -O https://wordpress.org/latest.tar.gz
#     # tar -xzvf latest.tar.gz
#     # rm -rf latest.tar.gz
#     # cp -r wordpress/* .
#     # rm -rf wordpress

#     # Install WP-CLI
#     # curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
#     # chmod +x wp-cli.phar
#     # mv wp-cli.phar /usr/local/bin/wp

#     # Configure WordPress
#     sed -i -r "s/database_name_here/${MYSQL_DATABASE}/g" wp-config.php
#     sed -i -r "s/username_here/${MYSQL_USER}/g" wp-config.php
#     sed -i -r "s/password_here/${MYSQL_PASSWORD}/g" wp-config.php

#     # Install WordPress core
#     # wp core install --url=${DOMAIN_NAME}/ --title=${WP_TITLE} \
#     #     --admin_user=${ADMIN_WP_USER} --admin_password=${ADMIN_WP_PASSWORD} \
#     #     --admin_email=${ADMIN_WP_EMAIL} --skip-email --allow-root

#     # # Create additional user
#     # wp user create ${WP_USR} ${WP_USER_EMAIL} --role=author \
#     #     --user_pass=${WP_USER_PASSWORD} --allow-root

#     # # Update all plugins
#     # wp plugin update --all --allow-root
# fi

# # Configure PHP-FPM to listen on port 9000 (for PHP 8.2)
# # sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 9000/g' /usr/local/etc/php-fpm.d/www.conf
# # mkdir -p /run/php

# # Start PHP-FPM
# php-fpm -F




#!/bin/sh

echo "Waiting for database connection..."
sleep 10

WP_CLI_PATH="/usr/local/bin/wp"

if [ ! -f /var/www/html/wp-config.php ]; then
    cp wp-config-sample.php wp-config.php
fi

if [ ! -f "$WP_CLI_PATH" ]; then
    curl -o "$WP_CLI_PATH" https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x "$WP_CLI_PATH"
fi

chmod 777 /var/www/html

wp config set --allow-root DB_NAME $MYSQL_DATABASE
wp config set --allow-root DB_USER $MYSQL_USER
wp config set --allow-root DB_PASSWORD $MYSQL_PASSWORD
wp config set --allow-root DB_HOST $MYSQL_HOST
wp config set --allow-root WP_HOME "https://$DOMAIN_NAME"
wp config set --allow-root WP_SITEURL "https://$DOMAIN_NAME"

if ! wp core is-installed --allow-root; then
    echo "Installing WordPress core..."
    wp core install \
        --url="$DOMAIN_NAME" \
        --title="My Automated WordPress Site" \
        --admin_user="$ADMIN_WP_USER" \
        --admin_password="$ADMIN_WP_PASSWORD" \
        --admin_email="$ADMIN_WP_EMAIL" \
        --skip-email \
        --allow-root

    echo "Creating additional user..."
    wp core update --allow-root && \
    wp core update-db --allow-root && \
    wp user create \
        --allow-root \
        "$WP_USER" \
        "$WP_USER_EMAIL" \
        --user_pass="$WP_USER_PASSWORD" \
        --role=editor


    # echo "Installing and activating Astra theme..."
    # wp theme install --allow-root astra --activate
else
    echo "WordPress is already installed."
fi