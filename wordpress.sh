#!/usr/bin/env bash

set -e # Exit script immediately on first error.
set -x # Print commands and their arguments as they are executed.

printf "Installing and Configuring WordPress\n"

# Grab a copy of wordpress from github...
git clone https://github.com/WordPress/WordPress.git wordpress

# Create a symlink in the server dir
sudo ln -s /home/vagrant/wordpress /srv/www/wordpress

printf "Creating WordPress database and user\n"
mysql -uroot --password=password -e "CREATE DATABASE IF NOT EXISTS wordpress"
mysql -uroot --password=password -e "GRANT ALL PRIVILEGES ON wordpress.* TO wp@localhost IDENTIFIED BY 'wp';"

cd /home/vagrant/wordpress
sudo wp-cli core config --dbname="wordpress" --dbuser="wp" --dbpass="wp" --dbhost="localhost" --allow-root
sudo wp-cli core install --url="localhost:8888" --title="Vagrant WordPress" --admin_user="admin" --admin_password="p455w0rd" --admin_email="wordpress@the-jesus.com" --allow-root