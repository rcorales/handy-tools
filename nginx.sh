#!/bin/bash
sudo apt update -y
sudo apt install nginx -y
wget https://apt.puppetlabs.com/puppet6-release-focal.deb
sudo dpkg -i puppet6-release-focal.deb
sudo apt-get update -y
wget https://apt.puppetlabs.com/puppet6-release-focal.deb
sudo dpkg -i puppet6-release-focal.deb
sudo apt-get update -y
sudo apt-get install puppetserver -y
sed -i 's/2/1/g' /etc/default/puppetserver
#sudo nano /etc/default/puppetserver
sudo systemctl start puppetserver
sudo systemctl enable puppetserver

