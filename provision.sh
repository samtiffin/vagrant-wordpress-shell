#!/usr/bin/env bash

set -e # Exit script immediately on first error.
set -x # Print commands and their arguments as they are executed.

# Update apt index
sudo apt-get update -y

# Update default system packages
sudo apt-get upgrade -y

# Install GB locale
sudo locale-gen en_GB.UTF-8

# Update default system packages
sudo apt-get install git -y

# Install PHP5 FPM and common packages
sudo apt-get install php5-fpm php5-cli php5-curl php5-gd php5-imagick php5-mcrypt php5-mysqlnd -y

# Install NGINX
sudo apt-get install nginx -y

# Install MariaDB
MYSQL_ROOT_PASSWORD="password"
echo mysql-server mysql-server/root_password password $MYSQL_ROOT_PASSWORD | sudo debconf-set-selections
echo mysql-server mysql-server/root_password_again password $MYSQL_ROOT_PASSWORD | sudo debconf-set-selections
sudo apt-get install mariadb-server -y

# Install WP-CLI
curl -L https://raw.github.com/wp-cli/builds/gh-pages/phar/wp-cli.phar > wp-cli.phar
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp-cli

# Install PHP Composer
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
