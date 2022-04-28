#!/bin/bash
sudo apt update -y
sudo apt install nginx -y
wget https://apt.puppetlabs.com/puppet6-release-focal.deb
sudo dpkg -i puppet6-release-focal.deb
sudo apt-get update -y
sudo apt-get install puppet-agent -y
sudo systemctl start puppet
sudo systemctl enable puppet
#sudo systemctl status puppet
