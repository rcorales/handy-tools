#!/bin/bash
sudo apt update -y
sudo apt install nginx -y
sudo apt install mysql-server
sudo systemctl start mysql.service
