#!/usr/bin/env bash

set -e # Exit script immediately on first error.
set -x # Print commands and their arguments as they are executed.

printf "Configuring NGINX\n"

# Create document root
sudo mkdir -p /srv/www

# Remove default nginx site...
sudo rm /etc/nginx/sites-enabled/default

# Copy nginx config to correct place and create symlink to activate it
sudo cp /vagrant/configs/nginx /etc/nginx/sites-available/wordpress
sudo ln -s /etc/nginx/sites-{available,enabled}/wordpress

# Restart nginx to activate config changes...
sudo service nginx restart