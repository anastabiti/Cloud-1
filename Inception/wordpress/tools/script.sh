#!/bin/bash
echo "Waiting for database connection..."

# Install WP-CLI if not present
if [ ! -f "/usr/local/bin/wp" ]; then
    echo "Installing WP-CLI..."
    curl -s -o "/usr/local/bin/wp" https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x "/usr/local/bin/wp"
fi

# Set proper permissions (more secure than 777)
chmod 755 /var/www/html

# Create wp-config.php if it doesn't exist
if [ ! -f /var/www/html/wp-config.php ]; then
    echo "Creating wp-config.php..."
    cp wp-config-sample.php wp-config.php
fi


# Configure WordPress
echo "Configuring WordPress..."
wp config set --allow-root DB_NAME $MYSQL_DATABASE
wp config set --allow-root DB_USER $MYSQL_USER
wp config set --allow-root DB_PASSWORD $MYSQL_PASSWORD
wp config set --allow-root DB_HOST $MYSQL_HOST
wp config set --allow-root WP_HOME "https://$DOMAIN_NAME"
wp config set --allow-root WP_SITEURL "https://$DOMAIN_NAME"

# Install WordPress if not already installed
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

    echo "Installing and activating Astra theme..."
    wp theme install astra --activate --allow-root
    
    echo "WordPress installation complete!"
else
    echo "WordPress is already installed, performing updates..."
    wp core update --allow-root
    wp core update-db --allow-root
    wp plugin update --all --allow-root
fi

echo "WordPress setup completed successfully"