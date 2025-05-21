#!/bin/bash

echo "Waiting for database connection..."
sleep 10

# Try to detect the server's public IP
SERVER_IP=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4 || echo "")
if [ -z "$SERVER_IP" ]; then
    # If AWS metadata service isn't available, try alternate methods
    SERVER_IP=$(curl -s https://api.ipify.org || curl -s https://ifconfig.me || echo "localhost")
fi

echo "Detected server IP: $SERVER_IP"
echo "Starting WordPress configuration..."
cd /Cloud/wordpress

# Check if WordPress core files exist, if not download them
if [ ! -f "wp-login.php" ]; then
    echo "WordPress files not found. Downloading WordPress..."
    wp core download --allow-root
fi

# Creates a new wp-config.php with database constants
echo "Creating wp-config.php..."
wp config create --allow-root --skip-check \
     --dbname=$MARIADB_DATABASE --dbuser=$MARIADB_USER  --dbpass=$MARIADB_PASSWORD \
     --dbhost=$MYSQL_HOST 

# Creates the WordPress tables in the database using the detected IP
echo "Installing WordPress core with server IP: $SERVER_IP"

    wp core install \
        --url="https://$SERVER_IP" \
        --title="☁︎ السَّحَابَ الثِّقَالَ ☁︎" \
        --admin_user="$WORDPRESS_ADMIN" \
        --admin_password="$WORDPRESS_PASSWORD_ADMIN" \
        --admin_email="$ADMIN_WP_EMAIL" \
        --skip-email \
        --allow-root

# Creates a new user
echo "Creating additional user..."
wp user create $WORDPRESS_USER "member@$SERVER_IP" \
    --allow-root \
    --role=editor \
    --user_pass=$WORDPRESS_PASSWORD

# Update WordPress URLs in the database (redundant but just to be sure)
wp option update home "https://$SERVER_IP" --allow-root
wp option update siteurl "https://$SERVER_IP" --allow-root

# Add this to allow connections over IP address
echo "Adding WP_HOME and WP_SITEURL to wp-config.php"
wp config set WP_HOME "https://$SERVER_IP" --allow-root
wp config set WP_SITEURL "https://$SERVER_IP" --allow-root

# Additional configuration to help with SSL and redirects
wp config set FORCE_SSL_ADMIN true --allow-root
wp config set WP_DEBUG true --allow-root

echo "WordPress configuration completed"

# Start PHP-FPM
echo "Starting PHP-FPM..."
exec php-fpm

