#!/bin/bash

echo "Waiting for database connection..."
sleep 10

# # Try to detect the server's public IP
# SERVER_IP=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4 || echo "")
# if [ -z "$SERVER_IP" ]; then
#     # If AWS metadata service isn't available, try alternate methods
#     SERVER_IP=$(curl -s https://api.ipify.org || curl -s https://ifconfig.me || echo "localhost")
# fi

# echo "Detected server IP: $SERVER_IP"
# echo "Starting WordPress configuration..."
# cd /Cloud/wordpress

# # Check if WordPress core files exist, if not download them
# if [ ! -f "wp-login.php" ]; then
#     echo "WordPress files not found. Downloading WordPress..."
#     wp core download --allow-root
# fi

# # Creates a new wp-config.php with database constants
# echo "Creating wp-config.php..."
# wp config create --allow-root --skip-check \
#      --dbname=$MYSQL_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD \
#      --dbhost=$MYSQL_HOST

# # Creates the WordPress tables in the database using the detected IP
# echo "Installing WordPress core with server IP: $SERVER_IP"
# wp core install \
#     --url="https://$SERVER_IP" \
#     --title="ATABITI INCEPTION" \
#     --admin_user=$WORDPRESS_ADMIN \
#     --admin_password=$WORDPRESS_PASSWORD_ADMIN \
#     --admin_email="atabiti@student.1337.ma" --allow-root

# # Creates a new user
# echo "Creating additional user..."
# wp user create $WORDPRESS_USER "anas@$SERVER_IP" \
#     --allow-root \
#     --role=editor \
#     --user_pass=$WORDPRESS_PASSWORD

# # Update WordPress URLs in the database (redundant but just to be sure)
# wp option update home "https://$SERVER_IP" --allow-root
# wp option update siteurl "https://$SERVER_IP" --allow-root

# # Add this to allow connections over IP address
# echo "Adding WP_HOME and WP_SITEURL to wp-config.php"
# wp config set WP_HOME "https://$SERVER_IP" --allow-root
# wp config set WP_SITEURL "https://$SERVER_IP" --allow-root

# # Additional configuration to help with SSL and redirects
# wp config set FORCE_SSL_ADMIN true --allow-root
# wp config set WP_DEBUG true --allow-root

# echo "WordPress configuration completed"

# # Start PHP-FPM
echo "Starting PHP-FPM..."
exec php-fpm

# cd  /Cloud/wordpress && wp config create	--allow-root --skip-check \
# 	 --dbname=$MYSQL_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD \
# 	  --dbhost=$MYSQL_HOST --path=/Cloud/wordpress
# ################################################################################
# #2 Creates the WordPress tables in the database using the URL, title, 
# # and default admin user details provided. Performs the famous 5 minute install in seconds or less.

# cd  /Cloud/wordpress &&  wp core install \
# 		--url="https://localhost"  \
# 		--title="ATABITI INCEPTION" \
# 		--admin_user=$WORDPRESS_ADMIN  \
# 		--admin_password=$WORDPRESS_PASSWORD_ADMIN \
# 		--admin_email="atabiti@student.1337.ma" --allow-root
# ###############################################################################
# #3 Creates a new user.
# cd  /Cloud/wordpress &&  wp user create $WORDPRESS_USER	anas@localhost \
# 					--allow-root \
# 					--role=editor \
# 					--user_pass=$WORDPRESS_PASSWORD
# /usr/sbin/php-fpm7.3 -F




################################# MANUAL  ############################################
#--dbname=<dbname>  Set the database name.
#--dbuser=<dbuser>   Set the database user.
# [--dbpass=<dbpass>] Set the database user password.
#[--dbhost=<dbhost>] Set the database host.
#--skip-check If set, the database connection is not checked.

#-F, --nodaemonize
 #                  force to stay in foreground, and ignore daemonize option from config file