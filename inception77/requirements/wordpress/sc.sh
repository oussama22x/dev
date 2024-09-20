#!/bin/bash

if [ -f ./wp-config.php ];
then
    echo "Wordpress is already installed"
    exit 0
else
    cd /var/www

    wget https://wordpress.org/latest.tar.gz
    tar xfz latest.tar.gz
    rm -rf latest.tar.gz
    cd wordpress

    cp wp-config-sample.php wp-config.php
    sed -i "s/username_here/$DB_USER/g" wp-config.php
    sed -i "s/password_here/$DB_PASSWORD/g" wp-config.php
    sed -i "s/localhost/$HOST/g" wp-config.php
    sed -i "s/database_name_here/$DB_NAME/g" wp-config.php

    wp core install --url=$DOMAIN_NAME --title="My Blog" --admin_user=$DB_USER --admin_password=$DB_PASSWORD --allow-root --path=/var/www/wordpress
    wp user create $DB_USER --role=author --user_pass=$DB_PASSWORD --allow-root --path=/var/www/wordpress

    echo "Wordpress is installed"
fi

exec php-fpm7.4 -F

# if [ -f ./wp-config.php ]
# then
#     echo "WordPress is already exists"
# else
#     cd /var/www/
#     wget http://wordpress.org/wordpress-6.4.3.tar.gz
# 	tar xfz wordpress-6.4.3.tar.gz
# 	rm -rf wordpress-6.4.3.tar.gz
#     cd wordpress

# 	cp wp-config-sample.php wp-config.php
# 	sed -i "s/username_here/$DB_USER/g" wp-config.php
# 	sed -i "s/password_here/$DB_PASSWORD/g" wp-config.php
# 	sed -i "s/localhost/$HOST/g" wp-config.php
# 	sed -i "s/database_name_here/$DB_NAME/g" wp-config.php

# 	wp core install --url=$DOMAIN_NAME --title=INCEPTION --admin_user=$DB_USER --admin_password=$DB_PASSWORD --allow-root --path=/var/www/wordpress
# 	wp user create $USER --role=author --user_pass=$USER_PASSWORD --allow-root --path=/var/www/wordpress
# fi

# exec php-fpm7.4 -F




