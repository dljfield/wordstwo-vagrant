#!/usr/bin/env bash

echo " >>> Installing PHP"

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C
sudo add-apt-repository -y ppa:ondrej/php5-5.6

sudo apt-key update
sudo apt-get update

sudo apt-get install -qq php5-cli php5-fpm php5-mysql php5-pgsql php5-sqlite php5-curl php5-gd php5-gmp php5-mcrypt php5-memcached php5-imagick php5-intl php5-xdebug

sudo sed -i "s/user = www-data/user = vagrant/" /etc/php5/fpm/pool.d/www.conf
sudo sed -i "s/group = www-data/group = vagrant/" /etc/php5/fpm/pool.d/www.conf

# Setting up composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
