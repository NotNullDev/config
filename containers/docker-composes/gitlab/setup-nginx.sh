#!/bin/bash

sudo apt update && sudo apt install nginx -y

cat << eof | sute tee /etc/nginx/sites-available/default
server {
    listen 80;
    server_name internal.github.com;

    location / {
        proxy_pass  http://127.0.0.1:8005/;
        proxy_set_header   X-Forwarded-For $remote_addr;
        proxy_set_header   Host $http_host;
    }
}
eof
