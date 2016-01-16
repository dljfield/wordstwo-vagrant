#!/usr/bin/env bash

echo -e "\033[0;32m >>> Setting up site \033[0m"

cat <<EOF > /etc/nginx/sites-available/project
server {
    listen 80;
    listen [::]:80 ipv6only=on;

    root /var/www/project/public;
    index index.html index.htm;

    server_name project.dev;

    location / {
        try_files \$uri \$uri.html \$uri/ =404;
    }

    error_page 404 /404.html;
    error_page 500 502 503 504 /50x.html;
    location = /50x.html {
        root /usr/share/nginx/html;
    }
}
EOF

ln -s /etc/nginx/sites-available/project /etc/nginx/sites-enabled/project

sudo service nginx reload
