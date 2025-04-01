#1 Creates a new wp-config.php with database constants
cd  /atabiti/wordpress && wp config create	--allow-root --skip-check \
	 --dbname=$MYSQL_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD \
	  --dbhost=$MYSQL_HOST --path=/atabiti/wordpress
################################################################################
#2 Creates the WordPress tables in the database using the URL, title, 
# and default admin user details provided. Performs the famous 5 minute install in seconds or less.

cd  /atabiti/wordpress &&  wp core install \
		--url="https://atabiti.42.fr"  \
		--title="ATABITI INCEPTION" \
		--admin_user=$WORDPRESS_ADMIN  \
		--admin_password=$WORDPRESS_PASSWORD_ADMIN \
		--admin_email="atabiti@student.1337.ma" --allow-root
###############################################################################
#3 Creates a new user.
cd  /atabiti/wordpress &&  wp user create $WORDPRESS_USER	anas@atabiti.42.fr \
					--allow-root \
					--role=editor \
					--user_pass=$WORDPRESS_PASSWORD
/usr/sbin/php-fpm7.3 -F




################################# MANUAL  ############################################
#--dbname=<dbname>  Set the database name.
#--dbuser=<dbuser>   Set the database user.
# [--dbpass=<dbpass>] Set the database user password.
#[--dbhost=<dbhost>] Set the database host.
#--skip-check If set, the database connection is not checked.

#-F, --nodaemonize
 #                  force to stay in foreground, and ignore daemonize option from config file