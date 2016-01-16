#!/usr/bin/env bash

echo "\033[0;32m >>> Installing MySQL \033[0m"

sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password password"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password password"

sudo apt-get install -qq mysql-server

sed -i "s/bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

MYSQL=`which mysql`

Q1="GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;"
Q2="FLUSH PRIVILEGES;"
SQL="${Q1}${Q2}"

$MYSQL -uroot -ppassword -e "$SQL"

service mysql restart
