# !/bin/bash

# Check if WordPress is already installed
# if [ ! -f /var/www/html/wp-config.php ]; then
    cd /var/www/html

    # Download and extract WordPress
    # curl -O https://wordpress.org/latest.tar.gz
    # tar -xzvf latest.tar.gz
    # rm -rf latest.tar.gz
    # cp -r wordpress/* .
    # rm -rf wordpress

    # Install WP-CLI
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp

    # Configure WordPress
    sed -i -r "s/database_name_here/${MYSQL_DATABASE}/g" wp-config.php
    sed -i -r "s/username_here/${MYSQL_USER}/g" wp-config.php
    sed -i -r "s/password_here/${MYSQL_PASSWORD}/g" wp-config.php

    # Install WordPress core
    # wp core install --url=${DOMAIN_NAME}/ --title=${WP_TITLE} \
    #     --admin_user=${ADMIN_WP_USER} --admin_password=${ADMIN_WP_PASSWORD} \
    #     --admin_email=${ADMIN_WP_EMAIL} --skip-email --allow-root

    # # Create additional user
    # wp user create ${WP_USR} ${WP_USER_EMAIL} --role=author \
    #     --user_pass=${WP_USER_PASSWORD} --allow-root

    # # Update all plugins
    # wp plugin update --all --allow-root
# fi

# Configure PHP-FPM to listen on port 9000 (for PHP 8.2)
# sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 9000/g' /usr/local/etc/php-fpm.d/www.conf
# mkdir -p /run/php

# Start PHP-FPM
# php-fpm -F