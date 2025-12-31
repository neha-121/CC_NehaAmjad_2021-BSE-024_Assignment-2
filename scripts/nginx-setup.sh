#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install nginx1 -y
sudo systemctl start nginx
sudo systemctl enable nginx
echo "<h1>Nginx Server is Working</h1>" | sudo tee /usr/share/nginx/html/index.html
