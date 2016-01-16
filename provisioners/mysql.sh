#!/usr/bin/env bash

echo " >>> Installing MySQL"

sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password password"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password password"

sudo apt-get install -qq mysql-server
