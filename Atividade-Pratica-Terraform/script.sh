#!/bin/bash
apt-get update -y
apt-get install -y git wget curl nano vim htop net-tools
apt-get install -y nginx
systemctl enable nginx
systemctl start nginx

echo "server {
    listen 80;

    location / {
        proxy_pass http://terraform-irede-static.s3-website-us-east-1.amazonaws.com; # endereço do Bucket que foi levantado.
    }
}" > /etc/nginx/sites-available/default